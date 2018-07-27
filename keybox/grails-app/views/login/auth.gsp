<html>
<head>
	<meta name='layout' content='login'/>
	<title><g:message code="springSecurity.login.title"/></title>

</head>

<body>
<div id='login'>
	<div class="login-wrapper">
		<div class="login-container">
			<a href="./"><img width="16" height="16" src="${resource(dir: 'images', file: 'favicon.png')}" /> KEYBOX</a>
			<hr>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>

			<div class="form-group">
				<input class="form-control" name="j_username" id="username" placeholder="Usuario" type="text" value='${usuario?.user}'>
			</div>


			<div class="form-group">
				<input id="password" name="j_password" class="form-control" placeholder="Contraseña" type="password" value='${usuario?.pass}'><input type="submit" id="submit" value="&#xf054;">
			</div>

            <div class="form-options clearfix">
                <div class="text-left">
                    <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                    <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
                </div>
            </div>

		</form>
	</div>
</div>

<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
