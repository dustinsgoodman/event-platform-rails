import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="event-form"
export default class extends Controller {
  static targets = [
    "venueType",
    "location1Container",
    "location2Container",
    "location3Container",
    "location4Container",
  ];

  handleVenueTypeChange() {
    if (this.venueTypeTarget.value !== "ONLINE") {
      this.location1ContainerTarget.classList.remove("hidden");
      this.location2ContainerTarget.classList.remove("hidden");
      this.location3ContainerTarget.classList.remove("hidden");
      this.location4ContainerTarget.classList.remove("hidden");
    } else {
      this.location1ContainerTarget.classList.add("hidden");
      this.location2ContainerTarget.classList.add("hidden");
      this.location3ContainerTarget.classList.add("hidden");
      this.location4ContainerTarget.classList.add("hidden");
    }
  }
}
