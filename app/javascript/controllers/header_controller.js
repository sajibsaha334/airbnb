import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'

export default class extends Controller {

    static targets = ['dropdown', 'openUserMenu']

    connect() {
        this.openUserMenuTarget.addEventListener("click", (e) => {
            toggleDropDown(this.dropdownTarget)
        })
    }
}

function toggleDropDown(element) {
    toggle(element)
}