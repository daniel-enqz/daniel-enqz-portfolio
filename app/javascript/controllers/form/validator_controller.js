import { Controller } from "stimulus";

export default class extends Controller {
static targets = ["firstName", "lastName", "email", "message"];

  connect() {
    this.validateForm();
  }

  validateForm() {
    this.firstNameTarget.addEventListener("input", () => {
    this.validateField(this.firstNameTarget, "first_name");
  });

  this.lastNameTarget.addEventListener("input", () => {
    this.validateField(this.lastNameTarget, "last_name");
  });

  this.emailTarget.addEventListener("input", () => {
    this.validateField(this.emailTarget, "email");
  });

  this.messageTarget.addEventListener("input", () => {
    this.validateField(this.messageTarget, "message");
  });
  }

  validateField(field, fieldName) {
    if (field.value === "") {
      field.classList.add("border-red-500");
      field.classList.remove("border-green-500");
    } else {
      field.classList.remove("border-red-500");
      field.classList.add("border-green-500");
    }
  }
}
