var SignUp = React.createClass({
  getInitialState: function() {
    return { showSignUp: this.props.showSignUp }
  },
  componentDidMount: function () {
    document.addEventListener('click', this.handleHideSignUp)
    document.getElementById('sign-up-link').addEventListener('click', this.handleShowSignUp)
  },
  componentWillUnmount: function () {
    document.removeEventListener('click', this.handleHideSignUp)
    document.getElementById('sign-up-link').removeEventListener('click', this.handleShowSignUp)
  },
  handleHideSignUp: function (e) {
    // console.log(e.target)
    var tmp = $('#'+e.target.id).parents('ul').attr('id')
    // console.log(tmp)
    if (tmp != 'sign-up-link' && $(".logup").has(e.target).length <= 0 && tmp != 'sign-in-link') {
      // console.log('on cache sign up')
      ReactDOM.render(<div />, document.getElementById('signup'));
      this.state.showSignUp = false
    }
  },
  handleShowSignUp: function(e) {
    if (this.state.showSignUp) {
      // console.log('On cache')
      this.state.showSignUp = false
      ReactDOM.render(<div />, document.getElementById('signup'));
    } else {
      // console.log('On affiche')
      ReactDOM.render(<div dangerouslySetInnerHTML={{__html: this.props.sign_up}} />, document.getElementById('signup'));
      this.state.showSignUp = true
    }
  },
  render: function() {
    return <span id="signup-show">Nouveau client</span>
  }
});
