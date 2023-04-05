import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  newContact() {
    Turbo.visit("/contacts/new",{ action: "replace" });
  }
}