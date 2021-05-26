¶
CC:\Fac\SysopSquadTickets\Tickets\Application\DependencyInjection.cs
	namespace 	
Application
 
{ 
public 

static 
class 
DependencyInjection +
{		 
public

 
static

 
void

 
AddApplication

 )
(

) *
this

* .
IServiceCollection

/ A
services

B J
)

J K
{ 	
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
services 
. 
AddAutoMapper "
(" #
	AppDomain# ,
., -
CurrentDomain- :
.: ;
GetAssemblies; H
(H I
)I J
)J K
;K L
} 	
} 
} ∑
xC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\CreateTicketCommand\CreateTicketCommand.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Commands. 6
.6 7
CreateTicketCommand7 J
{		 
public

 

class

 
CreateTicketCommand

 $
:

% &
IRequest

' /
<

/ 0
Ticket

0 6
>

6 7
{ 
[ 	
Required	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
] 
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
public 
string 
Category 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
public 
string 
Priority 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
DateTime- 5
.5 6
Now6 9
;9 :
} 
} Ä!
C:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\CreateTicketCommand\CreateTicketCommandHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
TicketFeatures

 -
.

- .
Commands

. 6
.

6 7
CreateTicketCommand

7 J
{ 
public 

class &
CreateTicketCommandHandler +
:, -
IRequestHandler. =
<= >
CreateTicketCommand> Q
,Q R
TicketR X
>X Y
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
public &
CreateTicketCommandHandler )
() *
ITicketRepository* ;

repository< F
,F G
IMapperH O
mapperP V
)V W
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
Ticket  
>  !
Handle" (
(( )
CreateTicketCommand) <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
var 
ticket 
= 
_mapper  
.  !
Map! $
<$ %
Ticket% +
>+ ,
(, -
request- 4
)4 5
;5 6"
HttpRequestAccountsApi "
_request# +
=, -
new. 1"
HttpRequestAccountsApi2 H
(H I
)I J
;J K
var 
user 
= 
_request 
.  
GetUserById  +
(+ ,
ticket, 2
.2 3
UserId3 9
)9 :
;: ;
var 
location 
= 
user 
.  
Location  (
;( )
var 

consultant 
= 
_request %
.% &
GetBestConsultant& 7
(7 8
ticket8 >
.> ?
Category? G
,G H
locationI Q
)Q R
;R S
ticket   
.   
ConsultantId   
=    !

consultant  " ,
.  , -
Id  - /
;  / 0
ticket!! 
.!! 
Status!! 
=!! 
$str!! %
;!!% &
_request## 
.## '
UpdateNoOfTicketsConsultant## 0
(##0 1

consultant##1 ;
.##; <
Id##< >
,##> ?

consultant##@ J
.##J K
NumberOfTickets##K Z
,##Z [

consultant##\ f
.##f g 
TotalNumberOfTickets##g {
)##{ |
;##| }
	SendEmail$$ 

_sendEmail$$  
=$$! "
new$$# &
	SendEmail$$' 0
($$0 1
)$$1 2
;$$2 3

_sendEmail%% 
.%% 
SendEmailStatus%% &
(%%& '
ticket%%' -
.%%- .
Status%%. 4
,%%4 5
user%%6 :
)%%: ;
;%%; <
ticket'' 
.'' 
ConsultantEmail'' "
=''# $

consultant''% /
.''/ 0
Email''0 5
;''5 6
ticket(( 
.(( 
ConsultantName(( !
=((" #

consultant(($ .
.((. /
Username((/ 7
;((7 8
ticket)) 
.)) 
	UserEmail)) 
=)) 
user)) #
.))# $
Email))$ )
;))) *
ticket** 
.** 
UserName** 
=** 
user** "
.**" #
Username**# +
;**+ ,
return,, 
await,, 
_repository,, $
.,,$ %
CreateAsync,,% 0
(,,0 1
ticket,,1 7
),,7 8
;,,8 9
}-- 	
}.. 
}// ∞
ÄC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\DeleteTicketByIdCommand\DeleteTicketByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Commands. 6
.6 7#
DeleteTicketByIdCommand7 N
{ 
public 

class #
DeleteTicketByIdCommand (
:) *
IRequest+ 3
<3 4
bool4 8
>8 9
{ 
[		 	
BsonId			 
]		 
[

 	
BsonRepresentation

	 
(

 
BsonType

 $
.

$ %
ObjectId

% -
)

- .
]

. /
public 
readonly 
string 
Id !
;! "
public #
DeleteTicketByIdCommand &
(& '
string' -
id. 0
)0 1
{ 	
Id 
= 
id 
; 
} 	
} 
} ˘
áC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\DeleteTicketByIdCommand\DeleteTicketByIdCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Commands. 6
.6 7#
DeleteTicketByIdCommand7 N
{ 
public 

class *
DeleteTicketByIdCommandHandler /
:0 1
IRequestHandler2 A
<A B#
DeleteTicketByIdCommandB Y
,Y Z
bool[ _
>_ `
{		 
private

 
readonly

 
ITicketRepository

 *
_repository

+ 6
;

6 7
public *
DeleteTicketByIdCommandHandler -
(- .
ITicketRepository. ?

repository@ J
)J K
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
bool 
> 
Handle  &
(& '#
DeleteTicketByIdCommand' >
request? F
,F G
CancellationTokenH Y
cancellationTokenZ k
)k l
{ 	
return 
await 
_repository $
.$ %
DeleteAsync% 0
(0 1
request1 8
.8 9
Id9 ;
); <
;< =
} 	
} 
} „	
åC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\UpdateStatusTicketByIdCommand\UpdateStatusTicketByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Commands. 6
.6 7)
UpdateStatusTicketByIdCommand7 T
{ 
public		 

class		 )
UpdateStatusTicketByIdCommand		 .
:		/ 0
IRequest		1 9
<		9 :
Ticket		: @
>		@ A
{

 
[ 	
Required	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} £"
ìC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\UpdateStatusTicketByIdCommand\UpdateStatusTicketByIdCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Commands. 6
.6 7)
UpdateStatusTicketByIdCommand7 T
{ 
public 

class 0
$UpdateStatusTicketByIdCommandHandler 5
:6 7
IRequestHandler8 G
<G H)
UpdateStatusTicketByIdCommandH e
,e f
Ticketg m
>m n
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
public 0
$UpdateStatusTicketByIdCommandHandler 3
(3 4
ITicketRepository4 E

repositoryF P
,P Q
IMapperR Y
mapperZ `
)` a
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
Ticket  
>  !
Handle" (
(( ))
UpdateStatusTicketByIdCommand) F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
ticket 
= 
_mapper  
.  !
Map! $
<$ %
Ticket% +
>+ ,
(, -
request- 4
)4 5
;5 6
var 
updatedTicket 
= 
await  %
_repository& 1
.1 2
UpdateStatusAsync2 C
(C D
ticketD J
)J K
;K L
if 
( 
updatedTicket 
==  
null! %
)% &
return 
null 
; "
HttpRequestAccountsApi   "
_request  # +
=  , -
new  . 1"
HttpRequestAccountsApi  2 H
(  H I
)  I J
;  J K
var!! 
user!! 
=!! 
_request!! 
.!!  
GetUserById!!  +
(!!+ ,
updatedTicket!!, 9
.!!9 :
UserId!!: @
)!!@ A
;!!A B
	SendEmail"" 

_sendEmail""  
=""! "
new""# &
	SendEmail""' 0
(""0 1
)""1 2
;""2 3
var## 

consultant## 
=## 
_request## %
.##% &
GetConsultantById##& 7
(##7 8
updatedTicket##8 E
.##E F
ConsultantId##F R
)##R S
;##S T
if%% 
(%% 
request%% 
.%% 
Message%% 
!=%%  "
null%%# '
)%%' (
{&& 

_sendEmail'' 
.'' %
SendEmailStatusAndMessage'' 4
(''4 5
updatedTicket''5 B
.''B C
Status''C I
,''I J
user''K O
,''O P
request''Q X
.''X Y
Message''Y `
)''` a
;''a b
_request(( 
.(( -
!UpdateSolvedNoOfTicketsConsultant(( :
(((: ;

consultant((; E
.((E F
Id((F H
,((H I

consultant((J T
.((T U!
SolvedNumberOfTickets((U j
)((j k
;((k l
})) 
else** 

_sendEmail++ 
.++ 
SendEmailStatus++ *
(++* +
request+++ 2
.++2 3
Status++3 9
,++9 :
user++; ?
)++? @
;++@ A
if-- 
(-- 
updatedTicket-- 
.-- 
Status-- $
!=--% '
$str--( .
)--. /
_request.. 
... )
IncreaseNoOfTicketsConsultant.. 6
(..6 7

consultant..7 A
...A B
Id..B D
,..D E

consultant..F P
...P Q
NumberOfTickets..Q `
)..` a
;..a b
return00 
updatedTicket00  
;00  !
}11 	
}22 
}33 ª
ÄC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\UpdateTicketByIdCommand\UpdateTicketByIdCommand.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Commands. 6
.6 7#
UpdateTicketByIdCommand7 N
{ 
public		 

class		 #
UpdateTicketByIdCommand		 (
:		) *
IRequest		+ 3
<		3 4
Ticket		4 :
>		: ;
{

 
[ 	
Required	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
ConsultantId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Priority 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ç
áC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\UpdateTicketByIdCommand\UpdateTicketByIdCommandHandler.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Commands. 6
.6 7#
UpdateTicketByIdCommand7 N
{		 
public

 

class

 *
UpdateTicketByIdCommandHandler

 /
:

0 1
IRequestHandler

2 A
<

A B#
UpdateTicketByIdCommand

B Y
,

Y Z
Ticket

[ a
>

a b
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
public *
UpdateTicketByIdCommandHandler -
(- .
ITicketRepository. ?

repository@ J
,J K
IMapperL S
mapperT Z
)Z [
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
Ticket  
>  !
Handle" (
(( )#
UpdateTicketByIdCommand) @
requestA H
,H I
CancellationTokenJ [
cancellationToken\ m
)m n
{ 	
var 
ticket 
= 
_mapper  
.  !
Map! $
<$ %
Ticket% +
>+ ,
(, -
request- 4
)4 5
;5 6
var 
updatedTicket 
= 
await  %
_repository& 1
.1 2
UpdateAsync2 =
(= >
ticket> D
)D E
;E F
return 
updatedTicket  
;  !
} 	
} 
} º	
ëC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsByConsultantIdQuery\GetAllTicketsByConsultantIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 6,
 GetAllTicketsByConsultantIdQuery6 V
{ 
public		 

class		 ,
 GetAllTicketsByConsultantIdQuery		 1
:		2 3
IRequest		4 <
<		< =
IEnumerable		= H
<		H I
Ticket		I O
>		O P
>		P Q
{

 
[ 	
BsonId	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
readonly 
string 
ConsultantId +
;+ ,
public ,
 GetAllTicketsByConsultantIdQuery /
(/ 0
string0 6
consultantId7 C
)C D
{ 	
ConsultantId 
= 
consultantId '
;' (
} 	
} 
} ì
òC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsByConsultantIdQuery\GetAllTicketsByConsultantIdQueryHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
TicketFeatures

 -
.

- .
Queries

. 5
.

5 6,
 GetAllTicketsByConsultantIdQuery

6 V
{ 
public 

class 3
'GetAllTicketsByConsultantIdQueryHandler 8
:9 :
IRequestHandler; J
<J K,
 GetAllTicketsByConsultantIdQueryK k
,k l
IEnumerablem x
<x y
Tickety 
>	 Ä
>
Ä Å
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
public 3
'GetAllTicketsByConsultantIdQueryHandler 6
(6 7
ITicketRepository7 H

repositoryI S
)S T
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Ticket& ,
>, -
>- .
Handle/ 5
(5 6,
 GetAllTicketsByConsultantIdQuery6 V
requestW ^
,^ _
CancellationToken` q
cancellationToken	r É
)
É Ñ
{ 	
var 
listTickets 
= 
await #
_repository$ /
./ 0%
GetAllByConsultantIdAsync0 I
(I J
requestJ Q
.Q R
ConsultantIdR ^
)^ _
;_ `
if 
( 
! 
listTickets 
. 
Any !
(! "
)" #
)$ %
throw 
new 
ArgumentException +
(+ ,
$str, \
,\ ]
nameof^ d
(d e
requeste l
)l m
)m n
;n o
return 
listTickets 
; 
} 	
} 
} Ω
ÖC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsByStatusQuery\GetAllTicketsByStatusQuery.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 6&
GetAllTicketsByStatusQuery6 P
{ 
public 

class &
GetAllTicketsByStatusQuery +
:, -
IRequest. 6
<6 7
IEnumerable7 B
<B C
TicketC I
>I J
>J K
{ 
public		 
readonly		 
string		 
Status		 %
;		% &
public &
GetAllTicketsByStatusQuery )
() *
string* 0
status1 7
)7 8
{ 	
Status 
= 
status 
; 
} 	
} 
} ◊
åC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsByStatusQuery\GetAllTicketsByStatusQueryHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
TicketFeatures

 -
.

- .
Queries

. 5
.

5 6&
GetAllTicketsByStatusQuery

6 P
{ 
public 

class -
!GetAllTicketsByStatusQueryHandler 2
:3 4
IRequestHandler5 D
<D E&
GetAllTicketsByStatusQueryE _
,_ `
IEnumerablea l
<l m
Ticketm s
>s t
>t u
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
public -
!GetAllTicketsByStatusQueryHandler 0
(0 1
ITicketRepository1 B

repositoryC M
)M N
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Ticket& ,
>, -
>- .
Handle/ 5
(5 6&
GetAllTicketsByStatusQuery6 P
requestQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
)} ~
{ 	
var 
listTickets 
= 
await #
_repository$ /
./ 0
GetAllByStatusAsync0 C
(C D
requestD K
.K L
StatusL R
)R S
;S T
if 
( 
! 
listTickets 
. 
Any !
(! "
)" #
)$ %
throw 
new 
ArgumentException +
(+ ,
$str, T
,T U
nameofV \
(\ ]
request] d
)d e
)e f
;f g
return 
listTickets 
; 
} 	
} 
} Ü	
ÖC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsByUserIdQuery\GetAllTicketsByUserIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 6&
GetAllTicketsByUserIdQuery6 P
{ 
public		 

class		 &
GetAllTicketsByUserIdQuery		 +
:		, -
IRequest		. 6
<		6 7
IEnumerable		7 B
<		B C
Ticket		C I
>		I J
>		J K
{

 
[ 	
BsonId	 
] 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
readonly 
string 
UserId %
;% &
public &
GetAllTicketsByUserIdQuery )
() *
string* 0
userId1 7
)7 8
{ 	
UserId 
= 
userId 
; 
} 	
} 
} ë
åC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsByUserIdQuery\GetAllTicketsByUserIdQueryHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
TicketFeatures

 -
.

- .
Queries

. 5
.

5 6&
GetAllTicketsByUserIdQuery

6 P
{ 
public 

class -
!GetAllTicketsByUserIdQueryHandler 2
:3 4
IRequestHandler5 D
<D E&
GetAllTicketsByUserIdQueryE _
,_ `
IEnumerablea l
<l m
Ticketm s
>s t
>t u
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
public -
!GetAllTicketsByUserIdQueryHandler 0
(0 1
ITicketRepository1 B

repositoryC M
)M N
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Ticket& ,
>, -
>- .
Handle/ 5
(5 6&
GetAllTicketsByUserIdQuery6 P
requestQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
)} ~
{ 	
IEnumerable 
< 
Ticket 
> 
listTickets  +
=, -
await. 3
_repository4 ?
.? @
GetAllByUserIdAsync@ S
(S T
requestT [
.[ \
UserId\ b
)b c
;c d
if 
( 
! 
listTickets 
. 
Any  
(  !
)! "
)# $
throw 
new 
ArgumentException +
(+ ,
$str, R
,R S
nameofT Z
(Z [
request[ b
)b c
)c d
;d e
return 
listTickets 
; 
} 	
} 
} ’
uC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsQuery\GetAllTicketsQuery.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 6
GetAllTicketsQuery6 H
{ 
public 

class 
GetAllTicketsQuery #
:$ %
IRequest& .
<. /
IEnumerable/ :
<: ;
Ticket; A
>A B
>B C
{D E
}F G
} ë
|C:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetAllTicketsQuery\GetAllTicketsQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 6
GetAllTicketsQuery6 H
{		 
public

 

class

 %
GetAllTicketsQueryHandler

 *
:

+ ,
IRequestHandler

- <
<

< =
GetAllTicketsQuery

= O
,

O P
IEnumerable

Q \
<

\ ]
Ticket

] c
>

c d
>

d e
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
public %
GetAllTicketsQueryHandler (
(( )
ITicketRepository) :

repository; E
)E F
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
Ticket& ,
>, -
>- .
Handle/ 5
(5 6
GetAllTicketsQuery6 H
requestI P
,P Q
CancellationTokenR c
cancellationTokend u
)u v
{ 	
return 
await 
_repository $
.$ %
GetAllAsync% 0
(0 1
)1 2
;2 3
} 	
} 
} ñ
uC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetTicketByIdQuery\GetTicketByIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 6
GetTicketByIdQuery6 H
{ 
public 

class 
GetTicketByIdQuery #
:$ %
IRequest& .
<. /
Ticket/ 5
>5 6
{		 
[

 	
BsonId

	 
]

 
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
readonly 
string 
Id !
;! "
public 
GetTicketByIdQuery !
(! "
string" (
id) +
)+ ,
{ 	
Id 
= 
id 
; 
} 	
} 
} î
|C:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetTicketByIdQuery\GetTicketByIdQueryHandler.cs
	namespace

 	
Application


 
.

 
Features

 
.

 
TicketFeatures

 -
.

- .
Queries

. 5
.

5 6
GetTicketByIdQuery

6 H
{ 
public 

class %
GetTicketByIdQueryHandler *
:+ ,
IRequestHandler- <
<< =
GetTicketByIdQuery= O
,O P
TicketQ W
>W X
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
public %
GetTicketByIdQueryHandler (
(( )
ITicketRepository) :

repository; E
)E F
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
Ticket  
>  !
Handle" (
(( )
GetTicketByIdQuery) ;
request< C
,C D
CancellationTokenE V
cancellationTokenW h
)h i
{ 	
var 
ticket 
= 
await 
_repository *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
Id@ B
)B C
;C D
if 
( 
ticket 
== 
null 
) 
throw 
new 
ArgumentException +
(+ ,
$str, ?
,? @
nameofA G
(G H
requestH O
)O P
)P Q
;Q R"
HttpRequestAccountsApi "
_request# +
=, -
new. 1"
HttpRequestAccountsApi2 H
(H I
)I J
;J K
var 

consultant 
= 
_request %
.% &
GetConsultantById& 7
(7 8
ticket8 >
.> ?
ConsultantId? K
)K L
;L M
ticket 
. 
ConsultantScore "
=# $

consultant% /
./ 0
Score0 5
;5 6
return 
ticket 
; 
}   	
}!! 
}"" ≥	
õC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetTicketByUserIdAndConsultantIdQuery\GetTicketByUserIdAndConsultantIdQuery.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 61
%GetTicketByUserIdAndConsultantIdQuery6 [
{ 
public 

class 1
%GetTicketByUserIdAndConsultantIdQuery 6
:7 8
IRequest9 A
<A B
TicketB H
>H I
{ 
public 
readonly 
string 
UserId %
;% &
public		 
readonly		 
string		 
ConsultantId		 +
;		+ ,
public 1
%GetTicketByUserIdAndConsultantIdQuery 4
(4 5
string5 ;
userId< B
,B C
stringD J
consultantIdK W
)W X
{ 	
UserId 
= 
userId 
; 
ConsultantId 
= 
consultantId '
;' (
} 	
} 
} Û
¢C:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetTicketByUserIdAndConsultantIdQuery\GetTicketByUserIdAndConsultantIdQueryHandler.cs
	namespace 	
Application
 
. 
Features 
. 
TicketFeatures -
.- .
Queries. 5
.5 61
%GetTicketByUserIdAndConsultantIdQuery6 [
{		 
public

 

class

 8
,GetTicketByUserIdAndConsultantIdQueryHandler

 =
:

> ?
IRequestHandler

@ O
<

O P1
%GetTicketByUserIdAndConsultantIdQuery

P u
,

u v
Ticket

w }
>

} ~
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
public 8
,GetTicketByUserIdAndConsultantIdQueryHandler ;
(; <
ITicketRepository< M

repositoryN X
)X Y
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
Ticket  
>  !
Handle" (
(( )1
%GetTicketByUserIdAndConsultantIdQuery) N
requestO V
,V W
CancellationTokenX i
cancellationTokenj {
){ |
{ 	
var 
ticket 
= 
await 
_repository  +
.+ ,+
GetByUserIdAndConsultantIdAsync, K
(K L
requestL S
.S T
UserIdT Z
,Z [
request\ c
.c d
ConsultantIdd p
)p q
;q r
if 
( 
ticket 
== 
null 
) 
{ 
throw 
new 
ArgumentException +
(+ ,
$str, ?
,? @
nameofA G
(G H
requestH O
)O P
)P Q
;Q R
} 
return 
ticket 
; 
} 	
} 
} ¬
CC:\Fac\SysopSquadTickets\Tickets\Application\Helpers\AppSettings.cs
	namespace 	
Application
 
. 
Helpers 
{ 
internal 
static 
class 
AppSettings %
{ 
internal 
static 
readonly  
string! '
BaseAddress( 3
=4 5
$str6 b
;b c
} 
} Æ
IC:\Fac\SysopSquadTickets\Tickets\Application\Helpers\AutoMapperProfile.cs
	namespace 	
Application
 
. 
Helpers 
{ 
public		 

class		 
AutoMapperProfile		 "
:		# $
Profile		% ,
{

 
public 
AutoMapperProfile  
(  !
)! "
{ 	
	CreateMap 
< #
UpdateTicketByIdCommand -
,- .
Ticket/ 5
>5 6
(6 7
)7 8
;8 9
	CreateMap 
< 
CreateTicketCommand )
,) *
Ticket+ 1
>1 2
(2 3
)3 4
;4 5
	CreateMap 
< )
UpdateStatusTicketByIdCommand 3
,3 4
Ticket5 ;
>; <
(< =
)= >
;> ?
} 	
} 
} ›7
NC:\Fac\SysopSquadTickets\Tickets\Application\Helpers\HttpRequestAccountsApi.cs
	namespace 	
Application
 
. 
Helpers 
{ 
public 

class "
HttpRequestAccountsApi '
{ 
private 
readonly 

HttpClient #
client$ *
;* +
public "
HttpRequestAccountsApi %
(% &
)& '
{ 	
client 
= 
new 

HttpClient #
(# $
)$ %
{ 
BaseAddress 
= 
new !
Uri" %
(% &
AppSettings& 1
.1 2
BaseAddress2 =
)= >
,> ?
} 
; 
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- 9
,9 :
$str; E
)E F
;F G
client 
. !
DefaultRequestHeaders (
.( )
Accept) /
./ 0
Add0 3
(3 4
new4 7+
MediaTypeWithQualityHeaderValue8 W
(W X
$strX j
)j k
)k l
;l m
} 	
public 
User 
GetUserById 
(  
string  &
userId' -
)- .
{ 	
var 
response 
= 
client !
.! "
GetAsync" *
(* +
$str+ :
+; <
userId= C
)C D
.D E
ResultE K
;K L
response 
. #
EnsureSuccessStatusCode ,
(, -
)- .
;. /
var 
result 
= 
response !
.! "
Content" )
.) *
ReadAsAsync* 5
<5 6
User6 :
>: ;
(; <
)< =
.= >
Result> D
;D E
return 
result 
; 
}   	
public"" 

Consultant"" 
GetConsultantById"" +
(""+ ,
string"", 2
consultantId""3 ?
)""? @
{## 	
var$$ 
response$$ 
=$$ 
client$$ !
.$$! "
GetAsync$$" *
($$* +
$str$$+ @
+$$A B
consultantId$$C O
)$$O P
.$$P Q
Result$$Q W
;$$W X
response%% 
.%% #
EnsureSuccessStatusCode%% ,
(%%, -
)%%- .
;%%. /
var&& 
result&& 
=&& 
response&& !
.&&! "
Content&&" )
.&&) *
ReadAsAsync&&* 5
<&&5 6

Consultant&&6 @
>&&@ A
(&&A B
)&&B C
.&&C D
Result&&D J
;&&J K
return'' 
result'' 
;'' 
}(( 	
public** 

Consultant** 
GetBestConsultant** +
(**+ ,
string**, 2
category**3 ;
,**; <
string**= C
location**D L
)**L M
{++ 	
var,, 
response,, 
=,, 
client,, !
.,,! "
GetAsync,," *
(,,* +
$str,,+ K
+,,L M
category,,N V
+,,W X
$str,,Y e
+,,f g
location,,h p
),,p q
.,,q r
Result,,r x
;,,x y
response-- 
.-- #
EnsureSuccessStatusCode-- ,
(--, -
)--- .
;--. /
var.. 
result.. 
=.. 
response.. !
...! "
Content.." )
...) *
ReadAsAsync..* 5
<..5 6

Consultant..6 @
>..@ A
(..A B
)..B C
...C D
Result..D J
;..J K
return// 
result// 
;// 
}00 	
public22 
void22 '
UpdateNoOfTicketsConsultant22 /
(22/ 0
string220 6
consultantId227 C
,22C D
int22E H
noOfTickets22I T
,22T U
int22V Y
totalNoOfTickets22Z j
)22j k
{33 	

Consultant44 

consultant44 !
=44" #
new44$ '

Consultant44( 2
{443 4
Id445 7
=448 9
consultantId44: F
,44F G
NumberOfTickets44H W
=44X Y
noOfTickets44Z e
-44f g
$num44h i
,44i j 
TotalNumberOfTickets44k 
=
44Ä Å
totalNoOfTickets
44Ç í
+
44ì î
$num
44ï ñ
}
44ñ ó
;
44ó ò
var55 
response55 
=55 
client55 !
.55! "
PutAsJsonAsync55" 0
(550 1
$str551 E
,55E F

consultant55G Q
)55Q R
.55R S
Result55S Y
;55Y Z
response66 
.66 #
EnsureSuccessStatusCode66 ,
(66, -
)66- .
;66. /
}77 	
public99 
void99 -
!UpdateSolvedNoOfTicketsConsultant99 5
(995 6
string996 <
consultantId99= I
,99I J
int99K N
solvedNoOfTickets99O `
)99` a
{:: 	

Consultant;; 

consultant;; !
=;;" #
new;;$ '

Consultant;;( 2
{;;3 4
Id;;5 7
=;;8 9
consultantId;;: F
,;;F G!
SolvedNumberOfTickets;;H ]
=;;^ _
solvedNoOfTickets;;` q
+;;r s
$num;;t u
};;v w
;;;w x
var<< 
response<< 
=<< 
client<< !
.<<! "
PutAsJsonAsync<<" 0
(<<0 1
$str<<1 E
,<<E F

consultant<<G Q
)<<Q R
.<<R S
Result<<S Y
;<<Y Z
response== 
.== #
EnsureSuccessStatusCode== ,
(==, -
)==- .
;==. /
}>> 	
public@@ 
void@@ )
IncreaseNoOfTicketsConsultant@@ 1
(@@1 2
string@@2 8
consultantId@@9 E
,@@E F
int@@G J
noOfTickets@@K V
)@@V W
{AA 	

ConsultantBB 

consultantBB !
=BB" #
newBB$ '

ConsultantBB( 2
{BB3 4
IdBB5 7
=BB8 9
consultantIdBB: F
,BBF G
NumberOfTicketsBBH W
=BBX Y
noOfTicketsBBZ e
+BBf g
$numBBh i
}BBj k
;BBk l
varCC 
responseCC 
=CC 
clientCC !
.CC! "
PutAsJsonAsyncCC" 0
(CC0 1
$strCC1 E
,CCE F

consultantCCG Q
)CCQ R
.CCR S
ResultCCS Y
;CCY Z
responseDD 
.DD #
EnsureSuccessStatusCodeDD ,
(DD, -
)DD- .
;DD. /
}EE 	
}FF 
}GG Ñ+
AC:\Fac\SysopSquadTickets\Tickets\Application\Helpers\SendEmail.cs
	namespace 	
Application
 
. 
Helpers 
{ 
public 

class 
	SendEmail 
{		 
private

 
readonly

 

SmtpClient

 #

smtpClient

$ .
;

. /
private 
readonly 
IConfiguration '
config( .
;. /
public 
	SendEmail 
( 
) 
{ 	
var 
builder 
= 
new  
ConfigurationBuilder 2
(2 3
)3 4
.4 5
AddJsonFile5 @
(@ A
$strA S
)S T
;T U
config 
= 
builder 
. 
Build "
(" #
)# $
;$ %

smtpClient 
= 
new 

SmtpClient '
(' (
config( .
[. /
$str/ :
]: ;
); <
{ 
Port 
= 
int 
. 
Parse  
(  !
config! '
[' (
$str( 3
]3 4
)4 5
,5 6
Credentials 
= 
new !
NetworkCredential" 3
(3 4
config4 :
[: ;
$str; J
]J K
,K L
configM S
[S T
$strT c
]c d
)d e
,e f
	EnableSsl 
= 
true  
,  !
} 
; 
} 	
public 
void 
SendEmailStatus #
(# $
string$ *
status+ 1
,1 2
User3 7
user8 <
)< =
{ 	
var 
mailMessage 
= 
new !
MailMessage" -
{ 
From 
= 
new 
MailAddress &
(& '
config' -
[- .
$str. =
]= >
)> ?
,? @
Subject 
= 
$str )
} 
; 
if!! 
(!! 
status!! 
==!! 
$str!! #
)!!# $
{"" 
mailMessage## 
.## 
Body##  
=##! "
$str### 1
+##2 3
user##4 8
.##8 9
Username##9 A
+##B C
$str##D L
+##M N
$str$$ >
+$$? @
$str	%% Å
+
%%Ç É
$str&& 9
;&&9 :
}'' 
if)) 
()) 
status)) 
==)) 
$str))  
)))  !
{** 
mailMessage++ 
.++ 
Body++  
=++! "
$str++# 1
+++2 3
user++4 8
.++8 9
Username++9 A
+++B C
$str++D L
+++M N
$str,, T
+,,U V
$str-- P
+--Q R
$str.. 9
;..9 :
}// 
if11 
(11 
status11 
==11 
$str11 %
)11% &
{22 
mailMessage33 
.33 
Body33  
=33! "
$str33# 1
+332 3
user334 8
.338 9
Username339 A
+33B C
$str33D L
+33M N
$str	44 Ñ
+
44Ö Ü
$str55 ;
+55< =
$str66 9
;669 :
}77 
mailMessage99 
.99 

IsBodyHtml99 "
=99# $
true99% )
;99) *
mailMessage:: 
.:: 
To:: 
.:: 
Add:: 
(:: 
user:: #
.::# $
Email::$ )
)::) *
;::* +

smtpClient<< 
.<< 
Send<< 
(<< 
mailMessage<< '
)<<' (
;<<( )
}== 	
public?? 
void?? %
SendEmailStatusAndMessage?? -
(??- .
string??. 4
status??5 ;
,??; <
User??< @
user??A E
,??E F
string??G M
message??N U
)??U V
{@@ 	
varAA 
mailMessageAA 
=AA 
newAA !
MailMessageAA" -
{BB 
FromCC 
=CC 
newCC 
MailAddressCC &
(CC& '
configCC' -
[CC- .
$strCC. =
]CC= >
)CC> ?
,CC? @
SubjectDD 
=DD 
$strDD )
,DD) *
BodyEE 
=EE 
$strEE %
+EE& '
userEE( ,
.EE, -
UsernameEE- 5
+EE6 7
$strEE8 @
+EEA B
$strFF C
+FFD E
$strGG 7
+GG8 9
messageGG: A
+GGB C
$strHH C
+HHC D
$strII 9
}JJ 
;JJ 
mailMessageKK 
.KK 

IsBodyHtmlKK "
=KK# $
trueKK% )
;KK) *
mailMessageLL 
.LL 
ToLL 
.LL 
AddLL 
(LL 
userLL #
.LL# $
EmailLL$ )
)LL) *
;LL* +

smtpClientNN 
.NN 
SendNN 
(NN 
mailMessageNN '
)NN' (
;NN( )
}OO 	
}QQ 
}RR ¯
PC:\Fac\SysopSquadTickets\Tickets\Application\Interfaces\IApplicationDbContext.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface !
IApplicationDbContext *
{ 
MongoClient 
Client 
{ 
get  
;  !
set" %
;% &
}' (
IMongoCollection 
< 
T 
> 
GetCollection )
<) *
T* +
>+ ,
(, -
)- .
;. /
}		 
}

 ¡
FC:\Fac\SysopSquadTickets\Tickets\Application\Interfaces\IRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
IRepository  
<  !
TEntity! (
>( )
where* /
TEntity0 7
:8 9

BaseEntity: D
{ 
Task		 
<		 
TEntity		 
>		 
CreateAsync		 !
(		! "
TEntity		" )
entity		* 0
)		0 1
;		1 2
Task

 
<

 
bool

 
>

 
DeleteAsync

 
(

 
string

 %
id

& (
)

( )
;

) *
Task 
< 
TEntity 
> 
UpdateAsync !
(! "
TEntity" )
entity* 0
)0 1
;1 2
Task 
< 
IEnumerable 
< 
TEntity  
>  !
>! "
GetAllAsync# .
(. /
)/ 0
;0 1
Task 
< 
TEntity 
> 
GetByIdAsync "
(" #
string# )
id* ,
), -
;- .
Task 
< 
IEnumerable 
< 
TEntity  
>  !
>! "
GetAllByUserIdAsync# 6
(6 7
string7 =
userId> D
)D E
;E F
Task 
< 
IEnumerable 
< 
TEntity  
>  !
>! "%
GetAllByConsultantIdAsync# <
(< =
string= C
consultantIdD P
)P Q
;Q R
Task 
< 
IEnumerable 
< 
TEntity  
>  !
>! "
GetAllByStatusAsync# 6
(6 7
string7 =
status> D
)D E
;E F
Task 
< 
TEntity 
> +
GetByUserIdAndConsultantIdAsync 5
(5 6
string6 <
userId= C
,C D
stringE K
consultantIdL X
)X Y
;Y Z
Task 
< 
TEntity 
> 
UpdateStatusAsync '
(' (
TEntity( /
entity0 6
)6 7
;7 8
} 
} Õ
RC:\Fac\SysopSquadTickets\Tickets\Application\Interfaces\ITicketDatabaseSettings.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface #
ITicketDatabaseSettings ,
{ 
string 
ConnectionString 
{  !
get" %
;% &
set' *
;* +
}, -
string 
DatabaseName 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ˇ
LC:\Fac\SysopSquadTickets\Tickets\Application\Interfaces\ITicketRepository.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public 

	interface 
ITicketRepository &
:' (
IRepository) 4
<4 5
Ticket5 ;
>; <
{= >
}? @
} 