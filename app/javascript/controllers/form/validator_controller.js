import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["form", "firstName", "lastName", "email", "message", "subject", "vaildMessage"];

  connect() {
    this.invalidFields = [this.firstNameTarget, this.lastNameTarget, this.emailTarget, this.messageTarget, this.subjectTarget]
    this.validateFields();
  }

  validateFields() {
    this.firstNameTarget.addEventListener("input", () => {
      this.validateField(this.firstNameTarget, "first_name");
      this.validateForm();
    });

    this.lastNameTarget.addEventListener("input", () => {
      this.validateField(this.lastNameTarget, "last_name");
      this.validateForm();
    });

    this.emailTarget.addEventListener("input", () => {
      this.validateEmail(this.emailTarget, "email");
      this.validateForm();
    });

    this.messageTarget.addEventListener("input", () => {
      this.validateField(this.messageTarget, "message");
      this.validateForm();
    });

    this.subjectTarget.addEventListener("input", () => {
      this.validateField(this.subjectTarget, "subject");
      this.validateForm();
    });
  }

  validateForm() {
    if (this.invalidFields.length === 0) {
      this.vaildMessageTargets.forEach((message) => {
        message.classList.remove("hidden");
      });
    } else {
      this.vaildMessageTargets.forEach((message) => {
        message.classList.add("hidden");
      });
    }
  }

  validateField(field, fieldName) {
    if (field.value === "") {
      field.classList.add("bg-red-50");
      field.classList.remove("bg-emerald-50");
      this.invalidFields.push(field);
    } else {
      field.classList.add("bg-emerald-50");
      field.classList.remove("bg-red-50");
      this.invalidFields = this.invalidFields.filter((f) => f !== field);
    }
  }

  validateEmail(field, fieldName) {
    if (field.value === "") {
      field.classList.add("bg-red-50");
      field.classList.remove("bg-emerald-50");
      this.invalidFields.push(field);
    } else {
      if (this.validateEmailFormat(field.value)) {
        field.classList.remove("bg-red-50");
        field.classList.add("bg-emerald-50");
        this.invalidFields = this.invalidFields.filter((f) => f !== field);

      } else {
        field.classList.add("bg-red-50");
        field.classList.remove("bg-emerald-50");
        this.invalidFields.push(field);
      }
    }
  }

  validateEmailFormat(email) {
    const re = /\S+@\S+\.\S+/;
    return re.test(email);
  }
}
