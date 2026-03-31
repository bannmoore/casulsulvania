/// <reference types="cypress" />

Cypress.Commands.add("visitOtpLink", (email: string) => {
  cy.task(
    "queryDb",
    `SELECT * FROM otps WHERE email = '${email}' LIMIT 1`
  ).then((result) => {
    cy.visit(`/admin/login/verify?otp=${result?.[0]?.otp}`);
  });
});

Cypress.Commands.add("login", (email: string) => {
  cy.visit("/admin/login");

  cy.get('input[id="email"]').type(email);
  cy.get('button[type="submit"]').click();
  cy.contains("Email sent.").should("exist");

  cy.visitOtpLink(email);

  cy.location("pathname").should("eq", "/admin/login/success");
  cy.contains("Admin Login Successful").should("exist");
});
