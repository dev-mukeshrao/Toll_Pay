<%@page import="java.net.URLEncoder"%>
<%
response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
response.setHeader( "Pragma", "no-cache" );
%>
<%
	if (session.getAttribute("id")==null)
	{
		   response.sendRedirect("index.jsp?msg="+ URLEncoder.encode("Please Login First"));
	}
%>

<%@page import="java.sql.Date"%>
<html>
<head>
<style>
* {
  font-family: 'Helvetica Neue', Helvetica, sans-serif;
  font-size: 19px;
  font-variant: normal;
  padding: 0;
  margin: 0;
}

html {
  height: 100%;
}

body {
  background: #424770;
  display: flex;
  align-items: center;
  min-height: 100%;
}

form {
  width: 480px;
  margin: 20px auto;
}

label {
  height: 35px;
  position: relative;
  color: #8798AB;
  display: block;
  margin-top: 30px;
  margin-bottom: 20px;
}

label > span {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  font-weight: 300;
  line-height: 32px;
  color: #8798AB;
  border-bottom: 1px solid #586A82;
  transition: border-bottom-color 200ms ease-in-out;
  cursor: text;
  pointer-events: none;
}

label > span span {
  position: absolute;
  top: 0;
  left: 0;
  transform-origin: 0% 50%;
  transition: transform 200ms ease-in-out;
  cursor: text;
}

label .field.is-focused + span span,
label .field:not(.is-empty) + span span {
  transform: scale(0.68) translateY(-36px);
  cursor: default;
}

label .field.is-focused + span {
  border-bottom-color: #34D08C;
}

.field {
  background: transparent;
  font-weight: 300;
  border: 0;
  color: white;
  outline: none;
  cursor: text;
  display: block;
  width: 100%;
  line-height: 32px;
  padding-bottom: 3px;
  transition: opacity 200ms ease-in-out;
}

.field::-webkit-input-placeholder { color: #8898AA; }
.field::-moz-placeholder { color: #8898AA; }

/* IE doesn't show placeholders when empty+focused */
 .field:-ms-input-placeholder { color: #424770; }

.field.is-empty:not(.is-focused) {
  opacity: 0;
}

button {
  float: left;
  display: block;
  background: #34D08C;
  color: white;
  border-radius: 2px;
  border: 0;
  margin-top: 20px;
  font-size: 19px;
  font-weight: 400;
  width: 100%;
  height: 47px;
  line-height: 45px;
  outline: none;
}

button:focus {
  background: #24B47E;
}

button:active {
  background: #159570;
}

.outcome {
  float: left;
  width: 100%;
  padding-top: 8px;
  min-height: 20px;
  text-align: center;
}

.success, .error {
  display: none;
  font-size: 15px;
}

.success.visible, .error.visible {
  display: inline;
}

.error {
  color: #E4584C;
}

.success {
  color: #34D08C;
}

.success .token {
  font-weight: 500;
  font-size: 15px;
}
</style>


</head>

<body>

<script src="https://js.stripe.com/v3/"></script>
<%
String vhno = request.getParameter("vh_no");
int vhid = Integer.parseInt(request.getParameter("vid"));
int jh_id = Integer.parseInt(request.getParameter("trip"));
String doj = request.getParameter("date");
String ntoll=request.getParameter("ntoll");
String dtime=request.getParameter("dtime");
String start=request.getParameter("start");
String end=request.getParameter("end");
System.out.println(" in make pay dtime : "+dtime+" start : "+start+" end : "+end+" trip : "+jh_id);
double pay= Double.parseDouble(request.getParameter("rt")); %>
<form action="${pageContext.request.contextPath}/Payment?vhno=<%=vhno%>&vhid=<%=vhid%>&jhid=<%=jh_id%>&doj=<%=doj%>&ntoll=<%=ntoll%>&pay=<%=pay%>&dtime=<%=dtime%>&start=<%=start%>&end=<%=end%>" method="POST" id="payment-form">
  <label>
    <input name="cardholder-name" class="field is-empty" value="Jane Doe" placeholder="Ex.Jane Doe" />
    <span><span>Name</span></span>
  </label>
  <label>
    <input class="field is-empty" type="tel" value="7844125462" placeholder="Ex.(123) 456-7890" />
    <span><span>Phone</span></span>
  </label>
  <label>
    <div id="card-element" class="field is-empty"></div>
    <span><span>Card</span></span>
  </label>
  <button type="submit">Pay &#8377; <%=request.getParameter("rt")%></button>
  <div class="outcome">
    <div class="error"></div>
    <div class="success">
      Success! Your Stripe token is <span class="token"></span>
    </div>
  </div>
</form>


<script>
var stripe = Stripe('pk_test_6pRNASCoBOKtIshFeQd4XMUh');
var elements = stripe.elements();

var card = elements.create('card', {
  iconStyle: 'solid',
  style: {
    base: {
      iconColor: '#8898AA',
      color: 'white',
      lineHeight: '36px',
      fontWeight: 300,
      fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
      fontSize: '19px',

      '::placeholder': {
        color: '#8898AA',
      },
    },
    invalid: {
      iconColor: '#e85746',
      color: '#e85746',
    }
  },
  classes: {
    focus: 'is-focused',
    empty: 'is-empty',
  },
});
card.mount('#card-element');

var inputs = document.querySelectorAll('input.field');
Array.prototype.forEach.call(inputs, function(input) {
  input.addEventListener('focus', function() {
    input.classList.add('is-focused');
  });
  input.addEventListener('blur', function() {
    input.classList.remove('is-focused');
  });
  input.addEventListener('keyup', function() {
    if (input.value.length === 0) {
      input.classList.add('is-empty');
    } else {
      input.classList.remove('is-empty');
    }
  });
});

function sub()
{
document.getElementById("payment-form").submit();
}

function setOutcome(result) {
  var successElement = document.querySelector('.success');
  var errorElement = document.querySelector('.error');
  successElement.classList.remove('visible');
  errorElement.classList.remove('visible');

  if (result.token) {
    // Use the token to create a charge or a customer
    // https://stripe.com/docs/charges
    successElement.querySelector('.token').textContent = result.token.id;
    successElement.classList.add('visible');
	insertRecord();
    sub();
  } else if (result.error) {
    errorElement.textContent = result.error.message;
    errorElement.classList.add('visible');
  }
}

card.on('change', function(event) {
  setOutcome(event);

});

document.querySelector('form').addEventListener('submit', function(e) {
  e.preventDefault();
  var form = document.querySelector('form');
  var extraDetails = {
    name: form.querySelector('input[name=cardholder-name]').value,
  };
  stripe.createToken(card, extraDetails).then(setOutcome);
  
});
</script>
</body>
</html>

<script>
function insertRecord()
{
	alert("payment successfully");
}
</script>

		
<script type="text/javascript" src="js/bootbox.min.js"></script>