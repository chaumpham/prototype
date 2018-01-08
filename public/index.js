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
      items: [],
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
  methods: {},
  computed: {}
};

var AddItemPage = {
  template: "#add-item-page",
  data: function() {
    return {
      name: "",
      size: "",
      brand: "",
      color: "",
      pattern: ""
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        size: this.size,
        brand: this.brand,
        color: this.color,
        pattern: this.pattern
      };
      axios
        .post("/v1/items", params)
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
        firstName: this.firstName,
        lastName: this.lastName,
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
  el: "#app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
