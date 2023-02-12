import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "firstName", "lastName", "email", "message", "subject", "validMessage"];

  connect() {
    this.validateFields();
  }

  validateFields() {
    this.validateInputField(this.firstNameTarget, "first_name");
    this.validateInputField(this.lastNameTarget, "last_name");
    this.validateInputField(this.emailTarget, "email", this.validateEmailFormat.bind(this));
    this.validateInputField(this.messageTarget, "message");
    this.validateInputField(this.subjectTarget, "subject");
  }

  addSuccessClasses(field) {
    field.classList.add("bg-emerald-50");
    field.classList.add("border-emerald-300");
    field.classList.remove("bg-red-50");
    field.classList.remove("border-red-300");
  }

  addErrorClasses(field) {
    field.classList.add("bg-red-50");
    field.classList.add("border-red-300");
    field.classList.remove("bg-emerald-50");
    field.classList.remove("border-emerald-300");
  }

  validateInputField(field, fieldName, validator = this.validateNotEmpty.bind(this)) {
    field.addEventListener("input", () => {
      validator(field, fieldName)
      this.validateForm();
    });
  }

  validateNotEmpty(field, fieldName) {
    if (field.value === "") {
      this.addErrorClasses(field);
    } else {
      this.addSuccessClasses(field);
    }
  }

  validateEmailFormat(field, fieldName) {
    const isValid = /\S+@\S+\.\S+/.test(field.value);

    if (isValid) {
      this.addSuccessClasses(field);
    } else {
      this.addErrorClasses(field);
    }
  }

  validateForm() {
    const invalidFields = [
      this.firstNameTarget,
      this.lastNameTarget,
      this.emailTarget,
      this.messageTarget,
      this.subjectTarget
    ].filter(field => field.value === "" || field.classList.contains("bg-red-50"));

    this.validMessageTargets.forEach((message) => {
      message.classList.toggle("hidden", invalidFields.length > 0);
    });
  }
}
