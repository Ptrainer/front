var SignIn = React.createClass({
  getInitialState: function() {
    return { showSignIn: this.props.showSignIn }
  },
  componentDidMount: function () {
    document.addEventListener('click', this.handleHideSignIn)
    document.getElementById('sign-in-link').addEventListener('click', this.handleShowSignIn)
  },
  componentWillUnmount: function () {
    document.removeEventListener('click', this.handleHideSignIn)
    document.getElementById('sign-in-link').removeEventListener('click', this.handleShowSignIn)
  },
  handleHideSignIn: function (e) {
    console.log(e.target)
    var tmp = $('#'+e.target.id).parents('ul').attr('id')
    if (tmp != 'sign-in-link' && $(".login").has(e.target).length <= 0) {
      ReactDOM.render(<div />, document.getElementById('signin'));
      this.state.showSignIn = false
    }
  },
  handleShowSignIn: function(e) {
    if (this.state.showSignIn) {
      this.state.showSignIn = false
      ReactDOM.render(<div />, document.getElementById('signin'));
    } else {
      ReactDOM.render(<div dangerouslySetInnerHTML={{__html: this.props.sign_in}} />, document.getElementById('signin'));
      this.state.showSignIn = true
    }
  },
  handleSignOut: function() {
    $.ajax({
      url: '/users/sign_out',
      method: 'DELETE',
      success: function(data) { location.reload() }
    })
  },
  render: function() {
    if (this.props.currentUser) {
      return <span onClick={this.handleSignOut}>Déconnexion</span>
    }
    return <span id="signin-show">Connexion</span>
  }
});
