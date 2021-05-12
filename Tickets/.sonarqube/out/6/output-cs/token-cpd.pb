◊
HC:\Fac\SysopSquadTickets\Tickets\WebApi\Controllers\BaseApiController.cs
	namespace 	
WebApi
 
. 
Controllers 
. 
v1 
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
public		 

class		 
BaseApiController		 "
:		# $
ControllerBase		% 3
{

 
	protected 
	IMediator 
Mediator $
;$ %
public 
BaseApiController  
(  !
	IMediator! *
mediator+ 3
)3 4
{ 	
this 
. 
Mediator 
= 
mediator $
;$ %
} 	
} 
} ”^
JC:\Fac\SysopSquadTickets\Tickets\WebApi\Controllers\v1\TicketController.cs
	namespace 	
WebApi
 
. 
Controllers 
. 
v1 
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
public 

class 
TicketController !
:" #
BaseApiController$ 5
{ 
public 
TicketController 
(  
	IMediator  )
mediator* 2
)2 3
:4 5
base6 :
(: ;
mediator; C
)C D
{E F
}G H
[ 	
HttpGet	 
] 
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status200OK* 5
)5 6
]6 7
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
return 
Ok 
( 
await 
Mediator $
.$ %
Send% )
() *
new* -
GetAllTicketsQuery. @
(@ A
)A B
)B C
)C D
;D E
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
[   	 
ProducesResponseType  	 
(   
StatusCodes   )
.  ) *
Status200OK  * 5
)  5 6
]  6 7
public!! 
async!! 
Task!! 
<!! 
IActionResult!! '
>!!' (
GetById!!) 0
(!!0 1
string!!1 7
id!!8 :
)!!: ;
{"" 	
try## 
{$$ 
return%% 
Ok%% 
(%% 
await%% 
Mediator%%  (
.%%( )
Send%%) -
(%%- .
new%%. 1
GetTicketByIdQuery%%2 D
(%%D E
id%%E G
)%%G H
)%%H I
)%%I J
;%%J K
}&& 
catch'' 
('' 
	Exception'' 
ex'' 
)''  
{(( 
return)) 

BadRequest)) !
())! "
new))" %
{))& '
error))( -
=)). /
ex))0 2
.))2 3
Message))3 :
})); <
)))< =
;))= >
}** 
}++ 	
[-- 	
HttpGet--	 
(-- 
$str-- )
)--) *
]--* +
[.. 	 
ProducesResponseType..	 
(.. 
StatusCodes.. )
...) *
Status200OK..* 5
)..5 6
]..6 7
public// 
async// 
Task// 
<// 
IActionResult// '
>//' (
GetAllByUserId//) 7
(//7 8
string//8 >
id//? A
)//A B
{00 	
try11 
{22 
return33 
Ok33 
(33 
await33 
Mediator33  (
.33( )
Send33) -
(33- .
new33. 1&
GetAllTicketsByUserIdQuery332 L
(33L M
id33M O
)33O P
)33P Q
)33Q R
;33R S
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
return77 

BadRequest77 !
(77! "
new77" %
{77& '
error77( -
=77. /
ex770 2
.772 3
Message773 :
}77; <
)77< =
;77= >
}88 
}99 	
[;; 	
HttpGet;;	 
(;; 
$str;; /
);;/ 0
];;0 1
[<< 	 
ProducesResponseType<<	 
(<< 
StatusCodes<< )
.<<) *
Status200OK<<* 5
)<<5 6
]<<6 7
public== 
async== 
Task== 
<== 
IActionResult== '
>==' ( 
GetAllByConsultantId==) =
(=== >
string==> D
id==E G
)==G H
{>> 	
try?? 
{@@ 
returnAA 
OkAA 
(AA 
awaitAA 
MediatorAA  (
.AA( )
SendAA) -
(AA- .
newAA. 1,
 GetAllTicketsByConsultantIdQueryAA2 R
(AAR S
idAAS U
)AAU V
)AAV W
)AAW X
;AAX Y
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 

BadRequestEE !
(EE! "
newEE" %
{EE& '
errorEE( -
=EE. /
exEE0 2
.EE2 3
MessageEE3 :
}EE; <
)EE< =
;EE= >
}FF 
}GG 	
[II 	
HttpGetII	 
(II 
$strII "
)II" #
]II# $
[JJ 	 
ProducesResponseTypeJJ	 
(JJ 
StatusCodesJJ )
.JJ) *
Status200OKJJ* 5
)JJ5 6
]JJ6 7
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (!
GetAllTicketsByStatusKK) >
(KK> ?
stringKK? E
statusKKF L
)KKL M
{LL 	
tryMM 
{NN 
returnOO 
OkOO 
(OO 
awaitOO 
MediatorOO  (
.OO( )
SendOO) -
(OO- .
newOO. 1&
GetAllTicketsByStatusQueryOO2 L
(OOL M
statusOOM S
)OOS T
)OOT U
)OOU V
;OOV W
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
exQQ 
)QQ  
{RR 
returnSS 

BadRequestSS !
(SS! "
newSS" %
{SS& '
errorSS( -
=SS. /
exSS0 2
.SS2 3
MessageSS3 :
}SS; <
)SS< =
;SS= >
}TT 
}UU 	
[WW 	
HttpGetWW	 
(WW 
$strWW 
)WW 
]WW 
[XX 	 
ProducesResponseTypeXX	 
(XX 
StatusCodesXX )
.XX) *
Status200OKXX* 5
)XX5 6
]XX6 7
publicYY 
asyncYY 
TaskYY 
<YY 
IActionResultYY '
>YY' (,
 GetTicketByUserIdAndConsultantIdYY) I
(YYI J1
%GetTicketByUserIdAndConsultantIdQueryYYJ o
queryYYp u
)YYu v
{ZZ 	
try[[ 
{\\ 
return]] 
Ok]] 
(]] 
await]] 
Mediator]]  (
.]]( )
Send]]) -
(]]- .
query]]. 3
)]]3 4
)]]4 5
;]]5 6
}^^ 
catch__ 
(__ 
	Exception__ 
ex__ 
)__  
{`` 
returnaa 

BadRequestaa !
(aa! "
newaa" %
{aa& '
erroraa( -
=aa. /
exaa0 2
.aa2 3
Messageaa3 :
}aa; <
)aa< =
;aa= >
}bb 
}cc 	
[ee 	
HttpPostee	 
(ee 
$stree 
)ee 
]ee 
[ff 	 
ProducesResponseTypeff	 
(ff 
StatusCodesff )
.ff) *
Status200OKff* 5
)ff5 6
]ff6 7
[gg 	 
ProducesResponseTypegg	 
(gg 
StatusCodesgg )
.gg) *
Status400BadRequestgg* =
)gg= >
]gg> ?
publichh 
asynchh 
Taskhh 
<hh 
IActionResulthh '
>hh' (
Createhh) /
(hh/ 0
[hh0 1
FromBodyhh1 9
]hh9 :
CreateTicketCommandhh; N
commandhhO V
)hhV W
{ii 	
varjj 
ticketjj 
=jj 
awaitjj 
Mediatorjj '
.jj' (
Sendjj( ,
(jj, -
commandjj- 4
)jj4 5
;jj5 6
ifkk 
(kk 
ticketkk 
==kk 
nullkk 
)kk 
returnll 

BadRequestll !
(ll! "
)ll" #
;ll# $
returnmm 
Okmm 
(mm 
ticketmm 
)mm 
;mm 
}nn 	
[pp 	
	HttpPatchpp	 
(pp 
$strpp +
)pp+ ,
]pp, -
[qq 	 
ProducesResponseTypeqq	 
(qq 
StatusCodesqq )
.qq) *
Status204NoContentqq* <
)qq< =
]qq= >
[rr 	 
ProducesResponseTyperr	 
(rr 
StatusCodesrr )
.rr) *
Status404NotFoundrr* ;
)rr; <
]rr< =
publicss 
asyncss 
Taskss 
<ss 
IActionResultss '
>ss' (
Updatess) /
(ss/ 0#
UpdateTicketByIdCommandss0 G
commandssH O
)ssO P
{tt 	
varuu 
ticketuu 
=uu 
awaituu 
Mediatoruu '
.uu' (
Senduu( ,
(uu, -
commanduu- 4
)uu4 5
;uu5 6
ifww 
(ww 
ticketww 
==ww 
nullww 
)ww 
returnxx 
NotFoundxx 
(xx  
)xx  !
;xx! "
returnzz 
	NoContentzz 
(zz 
)zz 
;zz 
}{{ 	
[}} 	
	HttpPatch}}	 
(}} 
$str}} "
)}}" #
]}}# $
[~~ 	 
ProducesResponseType~~	 
(~~ 
StatusCodes~~ )
.~~) *
Status204NoContent~~* <
)~~< =
]~~= >
[ 	 
ProducesResponseType	 
( 
StatusCodes )
.) *
Status404NotFound* ;
); <
]< =
public
ÄÄ 
async
ÄÄ 
Task
ÄÄ 
<
ÄÄ 
IActionResult
ÄÄ '
>
ÄÄ' (
UpdateStatus
ÄÄ) 5
(
ÄÄ5 6+
UpdateStatusTicketByIdCommand
ÄÄ6 S
command
ÄÄT [
)
ÄÄ[ \
{
ÅÅ 	
var
ÇÇ 
ticket
ÇÇ 
=
ÇÇ 
await
ÇÇ 
Mediator
ÇÇ '
.
ÇÇ' (
Send
ÇÇ( ,
(
ÇÇ, -
command
ÇÇ- 4
)
ÇÇ4 5
;
ÇÇ5 6
if
ÑÑ 
(
ÑÑ 
ticket
ÑÑ 
==
ÑÑ 
null
ÑÑ 
)
ÑÑ 
return
ÖÖ 
NotFound
ÖÖ 
(
ÖÖ  
)
ÖÖ  !
;
ÖÖ! "
return
áá 
	NoContent
áá 
(
áá 
)
áá 
;
áá 
}
àà 	
[
ää 	

HttpDelete
ää	 
(
ää 
$str
ää %
)
ää% &
]
ää& '
[
ãã 	"
ProducesResponseType
ãã	 
(
ãã 
StatusCodes
ãã )
.
ãã) * 
Status204NoContent
ãã* <
)
ãã< =
]
ãã= >
[
åå 	"
ProducesResponseType
åå	 
(
åå 
StatusCodes
åå )
.
åå) *
Status404NotFound
åå* ;
)
åå; <
]
åå< =
public
çç 
async
çç 
Task
çç 
<
çç 
IActionResult
çç '
>
çç' (
Delete
çç) /
(
çç/ 0
string
çç0 6
id
çç7 9
)
çç9 :
{
éé 	
var
èè 
deleted
èè 
=
èè 
await
èè 
Mediator
èè  (
.
èè( )
Send
èè) -
(
èè- .
new
èè. 1%
DeleteTicketByIdCommand
èè2 I
(
èèI J
id
èèJ L
)
èèL M
)
èèM N
;
èèN O
if
êê 
(
êê 
deleted
êê 
)
êê 
return
ëë 
	NoContent
ëë  
(
ëë  !
)
ëë! "
;
ëë" #
return
íí 
NotFound
íí 
(
íí 
)
íí 
;
íí 
}
ìì 	
}
îî 
}ïï ö

2C:\Fac\SysopSquadTickets\Tickets\WebApi\Program.cs
	namespace 	
WebApi
 
{ 
public 

static 
class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ¢4
2C:\Fac\SysopSquadTickets\Tickets\WebApi\Startup.cs
	namespace 	
WebApi
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddApiVersioning %
(% &
config& ,
=>- /
{ 
config 
. 
DefaultApiVersion (
=) *
new+ .

ApiVersion/ 9
(9 :
$num: ;
,; <
$num= >
)> ?
;? @
config 
. /
#AssumeDefaultVersionWhenUnspecified :
=; <
true= A
;A B
config 
. 
ReportApiVersions (
=) *
true+ /
;/ 0
}   
)   
;   
services"" 
."" 
AddCors"" 
("" 
("" 
options"" %
)""% &
=>""' )
{## 
options$$ 
.$$ 
	AddPolicy$$ !
($$! "
$str$$" ,
,$$, -
builder$$. 5
=>$$6 8
builder$$9 @
.$$@ A
AllowAnyOrigin$$A O
($$O P
)$$P Q
.$$Q R
AllowAnyMethod$$R `
($$` a
)$$a b
.$$b c
AllowAnyHeader$$c q
($$q r
)$$r s
)$$s t
;$$t u
}%% 
)%% 
;%% 
services'' 
.'' 
AddMvc'' 
('' 
option'' "
=>''# %
option''& ,
.'', -!
EnableEndpointRouting''- B
=''C D
false''E J
)''J K
;''K L
services)) 
.)) 
AddApplication)) #
())# $
)))$ %
;))% &
services** 
.** 
AddPersistence** #
(**# $
Configuration**$ 1
)**1 2
;**2 3
services,, 
.,, 
AddControllers,, #
(,,# $
),,$ %
.-- 
AddFluentValidation-- (
(--( )
s--) *
=>--+ -
{.. 
s// 
.// 4
(RegisterValidatorsFromAssemblyContaining// B
<//B C
Startup//C J
>//J K
(//K L
)//L M
;//M N
s00 
.00 @
4RunDefaultMvcValidationAfterFluentValidationExecutes00 N
=00O P
false00Q V
;00V W
}11 
)11 
;11 
services33 
.33 
AddSwaggerGen33 "
(33" #
c33# $
=>33% '
{44 
c55 
.55 

SwaggerDoc55 
(55 
$str55 !
,55! "
new55# &
OpenApiInfo55' 2
{553 4
Title555 :
=55; <
$str55= E
,55E F
Version55G N
=55O P
$str55Q U
}55V W
)55W X
;55X Y
c77 
.77 !
AddSecurityDefinition77 '
(77' (
$str77( 0
,770 1
new772 5!
OpenApiSecurityScheme776 K
{88 
Type99 
=99 
SecuritySchemeType99 -
.99- .
Http99. 2
,992 3
BearerFormat::  
=::! "
$str::# (
,::( )
In;; 
=;; 
ParameterLocation;; *
.;;* +
Header;;+ 1
,;;1 2
Scheme<< 
=<< 
$str<< %
,<<% &
Description== 
===  !
$str==" F
}>> 
)>> 
;>> 
c@@ 
.@@ "
AddSecurityRequirement@@ (
(@@( )
new@@) ,&
OpenApiSecurityRequirement@@- G
{AA 
{BB 
newCC !
OpenApiSecuritySchemeCC 1
{DD 
	ReferenceEE %
=EE& '
newEE( +
OpenApiReferenceEE, <
{FF 
TypeGG  $
=GG% &
ReferenceTypeGG' 4
.GG4 5
SecuritySchemeGG5 C
,GGC D
IdHH  "
=HH# $
$strHH% -
}II 
}JJ 
,JJ 
ArrayKK 
.KK 
EmptyKK #
<KK# $
stringKK$ *
>KK* +
(KK+ ,
)KK, -
}LL 
}MM 
)MM 
;MM 
}NN 
)NN 
;NN 
}OO 	
publicRR 
voidRR 
	ConfigureRR 
(RR 
IApplicationBuilderRR 1
appRR2 5
,RR5 6
IWebHostEnvironmentRR7 J
envRRK N
)RRN O
{SS 	
ifTT 
(TT 
envTT 
.TT 
IsDevelopmentTT !
(TT! "
)TT" #
)TT# $
{UU 
appVV 
.VV %
UseDeveloperExceptionPageVV -
(VV- .
)VV. /
;VV/ 0
appWW 
.WW 

UseSwaggerWW 
(WW 
)WW  
;WW  !
appXX 
.XX 
UseSwaggerUIXX  
(XX  !
cXX! "
=>XX# %
cXX& '
.XX' (
SwaggerEndpointXX( 7
(XX7 8
$strXX8 R
,XXR S
$strXXT _
)XX_ `
)XX` a
;XXa b
}YY 
app[[ 
.[[ 
UseHttpsRedirection[[ #
([[# $
)[[$ %
;[[% &
app]] 
.]] 

UseRouting]] 
(]] 
)]] 
;]] 
app^^ 
.^^ 
UseCors^^ 
(^^ 
$str^^ "
)^^" #
;^^# $
app`` 
.`` 
UseAuthentication`` !
(``! "
)``" #
;``# $
appaa 
.aa 
UseAuthorizationaa  
(aa  !
)aa! "
;aa" #
appbb 
.bb 
UseEndpointsbb 
(bb 
	endpointsbb &
=>bb' )
{cc 
	endpointsdd 
.dd 
MapControllersdd (
(dd( )
)dd) *
;dd* +
}ee 
)ee 
;ee 
}ff 	
}gg 
}hh ä(
RC:\Fac\SysopSquadTickets\Tickets\WebApi\Validators\CreateTicketCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
{ 
public 

class (
CreateTicketCommandValidator -
:. /
AbstractValidator0 A
<A B
CreateTicketCommandB U
>U V
{ 
private 
enum 
Category 
{		 	
Software

 
,

 
Hardware

 
,

 
Hr

  "
} 	
;	 

private 
enum 
Priority 
{ 	
High 
, 
Medium 
, 
Low 
} 	
;	 

public (
CreateTicketCommandValidator +
(+ ,
), -
{ 	
const 
string 
idRegex  
=! "
$str# 3
;3 4
RuleFor 
( 
ticket 
=> 
ticket $
.$ %
UserId% +
)+ ,
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyUserId9 D
)D E
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
RuleFor 
( 
ticket 
=> 
ticket $
.$ %
Title% *
)* +
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9

EmptyTitle9 C
)C D
. 
MinimumLength 
( 
$num  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?

ShortTitle? I
)I J
;J K
RuleFor   
(   
ticket   
=>   
ticket   $
.  $ %
Description  % 0
)  0 1
.!! 
Cascade!! 
(!! 
CascadeMode!! $
.!!$ %
Stop!!% )
)!!) *
."" 
NotEmpty"" 
("" 
)"" 
."" 
WithMessage"" '
(""' (
ValidationErrors""( 8
.""8 9
EmptyDescription""9 I
)""I J
.## 
MinimumLength## 
(## 
$num##  
)##  !
.##! "
WithMessage##" -
(##- .
ValidationErrors##. >
.##> ?
ShortDescription##? O
)##O P
;##P Q
RuleFor%% 
(%% 
ticket%% 
=>%% 
ticket%% $
.%%$ %
Category%%% -
)%%- .
.&& 
Cascade&& 
(&& 
CascadeMode&& (
.&&( )
Stop&&) -
)&&- .
.'' 
NotEmpty'' 
('' 
)'' 
.''  
WithMessage''  +
(''+ ,
ValidationErrors'', <
.''< =
EmptyCategory''= J
)''J K
.(( 

IsEnumName(( 
(((  
typeof((  &
(((& '
Category((' /
)((/ 0
,((0 1
caseSensitive((2 ?
:((? @
false((A F
)((F G
.((G H
WithMessage((H S
(((S T
ValidationErrors((T d
.((d e
InvalidCategory((e t
)((t u
;((u v
RuleFor** 
(** 
ticket** 
=>** 
ticket** $
.**$ %
Priority**% -
)**- .
.++ 
Cascade++ 
(++ 
CascadeMode++ (
.++( )
Stop++) -
)++- .
.,, 
NotEmpty,, 
(,, 
),, 
.,,  
WithMessage,,  +
(,,+ ,
ValidationErrors,,, <
.,,< =
EmptyPriority,,= J
),,J K
.-- 

IsEnumName-- 
(--  
typeof--  &
(--& '
Priority--' /
)--/ 0
,--0 1
caseSensitive--2 ?
:--? @
false--A F
)--F G
.--G H
WithMessage--H S
(--S T
ValidationErrors--T d
.--d e
InvalidPriority--e t
)--t u
;--u v
}.. 	
}// 
}00 æ
dC:\Fac\SysopSquadTickets\Tickets\WebApi\Validators\GetTicketByUserIdAndConsultantIdQueryValidator.cs
	namespace 	
WebApi
 
. 

Validators 
{ 
public 

class :
.GetTicketByUserIdAndConsultantIdQueryValidator ?
:@ A
AbstractValidatorB S
<S T1
%GetTicketByUserIdAndConsultantIdQueryT y
>y z
{ 
public :
.GetTicketByUserIdAndConsultantIdQueryValidator =
(= >
)> ?
{		 	
const

 
string

 
idRegex

  
=

! "
$str

# 3
;

3 4
RuleFor 
( 
ticket 
=> 
ticket $
.$ %
UserId% +
)+ ,
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyUserId9 D
)D E
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
RuleFor 
( 
ticket 
=> 
ticket $
.$ %
ConsultantId% 1
)1 2
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyConsultantId9 J
)J K
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
} 	
} 
} ‰
\C:\Fac\SysopSquadTickets\Tickets\WebApi\Validators\UpdateStatusTicketByIdCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
{ 
public 

class 2
&UpdateStatusTicketByIdCommandValidator 7
:8 9
AbstractValidator: K
<K L)
UpdateStatusTicketByIdCommandL i
>i j
{ 
private 
enum 
Status 
{		 	
Open

 
,

 
Solved

 
,

 
Canceled

 "
} 	
;	 

public 2
&UpdateStatusTicketByIdCommandValidator 5
(5 6
)6 7
{ 	
const 
string 
idRegex  
=! "
$str# 3
;3 4
RuleFor 
( 
ticket 
=> 
ticket $
.$ %
Id% '
)' (
. 
Cascade 
( 
CascadeMode $
.$ %
Stop% )
)) *
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
EmptyId9 @
)@ A
. 
Length 
( 
$num 
) 
. 
WithMessage '
(' (
ValidationErrors( 8
.8 9
InvalidIdLength9 H
)H I
. 
Matches 
( 
idRegex  
)  !
.! "
WithMessage" -
(- .
ValidationErrors. >
.> ?
InvalidIdStructure? Q
)Q R
;R S
RuleFor 
( 
ticket 
=> 
ticket $
.$ %
Status% +
)+ ,
. 
Cascade 
( 
CascadeMode (
.( )
Stop) -
)- .
. 
NotEmpty 
( 
) 
.  
WithMessage  +
(+ ,
ValidationErrors, <
.< =
EmptyStatus= H
)H I
. 

IsEnumName 
(  
typeof  &
(& '
Status' -
)- .
,. /
caseSensitive0 =
:= >
false? D
)D E
.E F
WithMessageF Q
(Q R
ValidationErrorsR b
.b c
InvalidStatusc p
)p q
;q r
} 	
} 
} ë,
VC:\Fac\SysopSquadTickets\Tickets\WebApi\Validators\UpdateTicketByIdCommandValidator.cs
	namespace 	
WebApi
 
. 

Validators 
{ 
public 

class ,
 UpdateTicketByIdCommandValidator 1
:2 3
AbstractValidator4 E
<E F#
UpdateTicketByIdCommandF ]
>] ^
{ 
private 
enum 
Status 
{		 	
Open

 
,

 
Solved

 
,

 
Canceled

 "
} 	
;	 

private 
enum 
Priority 
{ 	
High 
, 
Medium 
, 
Low 
} 	
;	 

public ,
 UpdateTicketByIdCommandValidator /
(/ 0
)0 1
{ 	
const 
string 
idRegex  
=! "
$str# 3
;3 4
When 
( 
ticket 
=> 
! 
string "
." #
IsNullOrEmpty# 0
(0 1
ticket1 7
.7 8
UserId8 >
)> ?
,? @
(A B
)B C
=>D F
{ 
RuleFor 
( 
ticket 
=> !
ticket" (
.( )
UserId) /
)/ 0
. 
Cascade 
( 
CascadeMode (
.( )
Stop) -
)- .
. 
NotEmpty 
( 
) 
.  
WithMessage  +
(+ ,
ValidationErrors, <
.< =
EmptyUserId= H
)H I
. 
Length 
( 
$num 
) 
.  
WithMessage  +
(+ ,
ValidationErrors, <
.< =
InvalidIdLength= L
)L M
. 
Matches 
( 
idRegex $
)$ %
.% &
WithMessage& 1
(1 2
ValidationErrors2 B
.B C
InvalidIdStructureC U
)U V
;V W
} 
) 
; 
When 
( 
ticket 
=> 
! 
string "
." #
IsNullOrEmpty# 0
(0 1
ticket1 7
.7 8
ConsultantId8 D
)D E
,E F
(G H
)H I
=>J L
{   
RuleFor!! 
(!! 
ticket!! 
=>!! !
ticket!!" (
.!!( )
ConsultantId!!) 5
)!!5 6
."" 
Cascade"" 
("" 
CascadeMode"" (
.""( )
Stop"") -
)""- .
.## 
NotEmpty## 
(## 
)## 
.##  
WithMessage##  +
(##+ ,
ValidationErrors##, <
.##< =
EmptyConsultantId##= N
)##N O
.$$ 
Length$$ 
($$ 
$num$$ 
)$$ 
.$$  
WithMessage$$  +
($$+ ,
ValidationErrors$$, <
.$$< =
InvalidIdLength$$= L
)$$L M
.%% 
Matches%% 
(%% 
idRegex%% $
)%%$ %
.%%% &
WithMessage%%& 1
(%%1 2
ValidationErrors%%2 B
.%%B C
InvalidIdStructure%%C U
)%%U V
;%%V W
}&& 
)&& 
;&& 
When)) 
()) 
ticket)) 
=>)) 
!)) 
string)) "
.))" #
IsNullOrEmpty))# 0
())0 1
ticket))1 7
.))7 8
Status))8 >
)))> ?
,))? @
())A B
)))B C
=>))D F
{** 
RuleFor++ 
(++ 
ticket++ 
=>++ !
ticket++" (
.++( )
Status++) /
)++/ 0
.,, 
Cascade,, 
(,, 
CascadeMode,, (
.,,( )
Stop,,) -
),,- .
.-- 

IsEnumName-- 
(--  
typeof--  &
(--& '
Status--' -
)--- .
,--. /
caseSensitive--0 =
:--= >
false--? D
)--D E
.--E F
WithMessage--F Q
(--Q R
ValidationErrors--R b
.--b c
InvalidStatus--c p
)--p q
;--q r
}.. 
).. 
;.. 
When00 
(00 
ticket00 
=>00 
!00 
string00 "
.00" #
IsNullOrEmpty00# 0
(000 1
ticket001 7
.007 8
Priority008 @
)00@ A
,00A B
(00C D
)00D E
=>00F H
{11 
RuleFor22 
(22 
ticket22 
=>22 !
ticket22" (
.22( )
Priority22) 1
)221 2
.33 
Cascade33 
(33 
CascadeMode33 (
.33( )
Stop33) -
)33- .
.44 

IsEnumName44 
(44  
typeof44  &
(44& '
Priority44' /
)44/ 0
,440 1
caseSensitive442 ?
:44? @
false44A F
)44F G
.44G H
WithMessage44H S
(44S T
ValidationErrors44T d
.44d e
InvalidPriority44e t
)44t u
;44u v
}55 
)55 
;55 
}66 	
}77 
}88 