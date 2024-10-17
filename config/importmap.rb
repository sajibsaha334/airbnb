# Pin npm packages by running ruby /bin/importmap pin "Package Name"

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "el-transition" # @0.0.7
pin "swiper" # @11.1.14
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "flatpickr" # @4.6.13
