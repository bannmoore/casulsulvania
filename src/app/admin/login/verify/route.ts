import database from "@/clients/database";
import { config } from "@/config";
import { redirectWithBaseUrl } from "@/util/next";
import { generateAccessToken } from "@/util/crypto";

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

    await database.deleteOtp(otp);

    const response = redirectWithBaseUrl("/admin/login/success");

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

    return redirectWithBaseUrl(`/admin/login/error?description=${message}`);
  }
}
