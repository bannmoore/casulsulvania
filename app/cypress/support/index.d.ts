export {};

declare global {
  namespace Cypress {
    interface Chainable {
      visitOtpLink(email: string): Chainable<void>;
      login(email: string): Chainable<void>;
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      task(event: "customTask"): Chainable<any[]>;
    }
  }
}
