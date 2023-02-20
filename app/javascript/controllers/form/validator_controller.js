import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "firstName", "lastName", "email", "message", "calendar", "subject", "validField", "invalidMessage"];

  connect() {
    this.validateFields();
  }

  validateFields() {
    this.validateInputField(this.firstNameTarget);
    this.validateInputField(this.lastNameTarget);
    this.validateInputField(this.emailTarget, this.validateEmailFormat.bind(this));
    this.validateInputField(this.messageTarget, this.validateMessage.bind(this));
    this.validateInputField(this.subjectTarget);
    this.validateInputField(this.calendarTarget);
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

  validateInputField(field, validator = this.validateNotEmpty.bind(this)) {
    field.addEventListener("input", () => {
      validator(field)
      this.validateForm();
    });
  }

  validateNotEmpty(field) {
    if (field.value === "") {
      this.addErrorClasses(field);
    } else {
      this.addSuccessClasses(field);
    }
  }

  validateEmailFormat(field) {
    const isValid = /\S+@\S+\.\S+/.test(field.value);

    if (isValid) {
      this.addSuccessClasses(field);
    } else {
      this.addErrorClasses(field);
    }
  }

  validateMessage(field) {
    if (field.value.length < 25) {
      this.addErrorClasses(field);
      this.invalidMessageTarget.classList.remove("hidden");
    } else if (field.value.length > 500) {
      this.addErrorClasses(field);
      this.invalidMessageTarget.classList.remove("hidden");
    } else {
      this.addSuccessClasses(field);
      this.invalidMessageTarget.classList.add("hidden");
    }
  }

  validateForm() {
    const invalidFields = [
      this.firstNameTarget,
      this.lastNameTarget,
      this.emailTarget,
      this.messageTarget,
      this.subjectTarget,
      this.calendarTarget
    ].filter(field => field.value === "" || field.classList.contains("bg-red-50"));

    this.validFieldTargets.forEach((message) => {
      message.classList.toggle("hidden", invalidFields.length > 0);
    });
  }
}
