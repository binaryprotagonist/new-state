import Vue from "vue";
import { ValidationProvider, ValidationObserver } from "vee-validate";
import { extend } from "vee-validate";
import VTextFieldWithValidation from "../components/VTextFieldWithValidation.vue";
import VSelectWithValidation from "../components/VSelectWithValidation.vue";
import VAutoCompleteWithValidation from "../components/VAutoCompleteWithValidation.vue";

import * as rules from "vee-validate/dist/rules";
import ca from "vee-validate/dist/locale/ca";

// loop over all rules
for (let rule in rules) {
    extend(rule, {
        ...rules[rule], // add the rule
        message: ca.messages[rule] // add its message
    });
}

Vue.component("ValidationProvider", ValidationProvider);
Vue.component("ValidationObserver", ValidationObserver);

Vue.component("VTextFieldWithValidation", VTextFieldWithValidation);
Vue.component("VSelectWithValidation", VSelectWithValidation);
Vue.component("VAutoCompleteWithValidation", VAutoCompleteWithValidation);
