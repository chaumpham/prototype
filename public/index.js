/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      items: []
    };
  },
  created: function() {
    axios.get("/v1/items").then(
      function(response) {
        this.items = response.data;
      }.bind(this)
    );
  },
  methods: {},
  computed: {}
};

var UserPage = {
  template: "#user-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      users: []
    };
  },
  created: function() {
    axios.get("/v1/users").then(
      function(response) {
        this.users = response.data;
      }.bind(this)
    );
  },
  methods: {},
  computed: {}
};

var UserShowPage = {
  template: "#user-show-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      user: {}
    };
  },
  created: function() {
    axios.get("/v1/users/" + this.$route.params.id).then(
      function(response) {
        this.user = response.data;
        console.log(this.user);
      }.bind(this)
    );
  },
  methods: {
    borrow: function() {
      var params = {
        borrower_id: current_user.id,
        item_id: this.item_id,
        // owner_id: this.user_id,
        // return_date: this.return_date,
        accepted: false
      };
      axios
        .post("v1/orders", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/login");
          }.bind(this)
        );
    }
  },
  computed: {}
};

var AddItemPage = {
  template: "#add-item-page",
  data: function() {
    return {
      newItem: {
        name: "",
        color: "",
        pattern: "",
        size: "",
        brand: ""
      },
      errors: []
    };
  },
  methods: {
    // submit: function() {
    //   var params = {
    //     name: this.name,
    //     status: 1,
    //     color: this.color,
    //     pattern: this.pattern,
    //     size: this.size,
    //     brand: this.brand,
    //     user_id: current_user.id
    //   };
    //   axios
    //     .post("/v1/items", params)
    //     .then(function(response) {
    //       router.push("/");
    //     })
    //     .catch(
    //       function(error) {
    //         this.errors = error.response.data.errors;
    //         router.push("/login");
    //       }.bind(this)
    //     );
    // },
    uploadFile: function(event) {
      if (event.target.files.length > 0) {
        var formData = new FormData();
        formData.append("name", this.newItem.name);
        formData.append("color", this.newItem.color);
        formData.append("pattern", this.newItem.pattern);
        formData.append("size", this.newItem.size);
        formData.append("brand", this.newItem.brand);
        formData.append("image", event.target.files[0]);

        axios.post("/v1/items", formData).then(function(response) {
          console.log(response);
          this.newItem = {
            name: "",
            color: "",
            pattern: "",
            size: "",
            brand: ""
          };
          event.target.value = "";
        });
      }
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.firstName,
        last_name: this.lastName,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/users", component: UserPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/users/:id", component: UserShowPage },
    { path: "/items/new", component: AddItemPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
