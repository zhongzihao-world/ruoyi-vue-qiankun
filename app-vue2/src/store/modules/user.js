const user = {
  state: {
    roles: [],
    permissions: [],
  },

  mutations: {
    SET_ROLES: (state, roles) => {
      state.roles = roles;
    },
    SET_PERMISSIONS: (state, permissions) => {
      state.permissions = permissions;
    },
  },

  actions: {},
};

export default user;
