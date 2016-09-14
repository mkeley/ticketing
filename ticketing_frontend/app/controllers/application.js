import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({

  session: service('session'),
  sessionAccount: service('session-account'),

  actions: {
    invalidateSession() {
      this.get('session').invalidate();
    }
  }

});
