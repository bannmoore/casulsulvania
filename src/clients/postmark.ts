import { config } from "@/config";
import * as postmark from "postmark";

export function sendEmail({
  to,
  subject,
  body,
}: {
  to: string;
  subject: string;
  body: string;
}) {
  console.debug(`Sending email to: ${to}`);
  const client = new postmark.ServerClient(config.postmarkApikey);

  client.sendEmail({
    From: "hello@bannmoore.dev",
    To: to,
    Subject: subject,
    HtmlBody: body,
  });
}
