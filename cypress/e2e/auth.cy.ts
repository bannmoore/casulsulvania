describe("auth", () => {
  it("should redirect unauthenticated users to the admin login", () => {
    cy.visit("/admin");

    cy.location("pathname").should("eq", "/admin/login");
    cy.get("h1").should("contain.text", "Admin Login");
  });

  it("should login", () => {
    cy.visit("/admin/login");

    cy.get('input[id="email"]').type("hello@bannmoore.dev");
    cy.get('button[type="submit"]').click();
    cy.contains("Email sent.").should("exist");

    cy.visitOtpLink("hello@bannmoore.dev");

    cy.location("pathname").should("eq", "/admin/login/success");
    cy.contains("Admin Login Successful").should("exist");
  });
});
