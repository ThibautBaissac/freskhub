import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="maps"
export default class extends Controller {
  static targets = ["map"]

  connect() {
    this.map = L.map(this.mapTarget).setView([0, 0], 10)

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(this.map)

    const instances = JSON.parse(this.data.get("instances"))
    const popupKey = this.data.get("popup-key")

    instances.forEach(instance => {
      if (instance.latitude && instance.longitude) {
        L.marker([instance.latitude, instance.longitude])
          .addTo(this.map)
          .bindPopup(`<b>${instance[popupKey]}</b>`)
      }
    })

    if (instances.length > 0) {
      const bounds = L.latLngBounds(instances.map(user => [user.latitude, user.longitude]))
      this.map.fitBounds(bounds)
    }
  }

  disconnect() {
    this.map.remove();
  }
}
