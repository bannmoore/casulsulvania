import database from "@/database";
import { config } from "@/config";
import { redirect } from "@/util";
import { generateAccessToken } from "@/otp";

export async function GET(request: Request) {
  try {
    const { searchParams } = new URL(request.url);
    const otp = searchParams.get("otp");

    if (!otp) {
      console.error("OTP must be provided");
      throw new Error("Unauthorized");
    }

    const user = await database.getUserFromOtp(otp);

    if (!user) {
      console.error("User not found");
      throw new Error("Unauthorized");
    }

    const accessToken = generateAccessToken(user.email);
    const expiresAt = new Date();
    expiresAt.setSeconds(expiresAt.getSeconds() + 604800); // 1 week

    await database.upsertSession({
      userId: user.id,
      token: accessToken,
      expiresAt,
    });

    const response = redirect("/admin");

    response.cookies.set("token", accessToken, {
      httpOnly: true,
      secure: config.env === "production",
      maxAge: 604800,
      path: "/",
      sameSite: "strict",
    });

    return response;
  } catch (err) {
    console.error(err);

    // https://kentcdodds.com/blog/get-a-catch-block-error-message-with-typescript
    let message = "Unknown Error";
    if (err instanceof Error) message = err.message;

    return redirect(`/admin/error?description=${message}`);
  }
}
