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
} ≠
C:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\CreateTicketCommand\CreateTicketCommandHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
TicketFeatures		 -
.		- .
Commands		. 6
.		6 7
CreateTicketCommand		7 J
{

 
public 

class &
CreateTicketCommandHandler +
:, -
IRequestHandler. =
<= >
CreateTicketCommand> Q
,Q R
TicketR X
>X Y
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
public &
CreateTicketCommandHandler )
() *
ITicketRepository* ;

repository< F
,F G
IMapperH O
mapperP V
)V W
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
Ticket  
>  !
Handle" (
(( )
CreateTicketCommand) <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
var 
ticket 
= 
_mapper  
.  !
Map! $
<$ %
Ticket% +
>+ ,
(, -
request- 4
)4 5
;5 6"
HttpRequestAccountsApi "
_request# +
=, -
new. 1"
HttpRequestAccountsApi2 H
(H I
)I J
;J K
var 
location 
= 
_request #
.# $
GetUserById$ /
(/ 0
ticket0 6
.6 7
UserId7 =
)= >
.> ?
Location? G
;G H
var 

consultant 
= 
_request %
.% &
GetBestConsultant& 7
(7 8
ticket8 >
.> ?
Category? G
,G H
locationI Q
)Q R
;R S
ticket 
. 
ConsultantId 
=  !

consultant" ,
., -
Id- /
;/ 0
ticket   
.   
Status   
=   
$str   %
;  % &
_request"" 
."" '
UpdateNoOfTicketsConsultant"" 0
(""0 1

consultant""1 ;
.""; <
Id""< >
,""> ?

consultant""@ J
.""J K
NumberOfTickets""K Z
)""Z [
;""[ \
return$$ 
await$$ 
_repository$$ $
.$$$ %
CreateAsync$$% 0
($$0 1
ticket$$1 7
)$$7 8
;$$8 9
}%% 	
}&& 
}'' ∞
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
} ó

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
}% &
[ 	
Required	 
] 
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ¡ 
ìC:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Commands\UpdateStatusTicketByIdCommand\UpdateStatusTicketByIdCommandHandler.cs
	namespace		 	
Application		
 
.		 
Features		 
.		 
TicketFeatures		 -
.		- .
Commands		. 6
.		6 7)
UpdateStatusTicketByIdCommand		7 T
{

 
public 

class 0
$UpdateStatusTicketByIdCommandHandler 5
:6 7
IRequestHandler8 G
<G H)
UpdateStatusTicketByIdCommandH e
,e f
Ticketg m
>m n
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
public 0
$UpdateStatusTicketByIdCommandHandler 3
(3 4
ITicketRepository4 E

repositoryF P
,P Q
IMapperR Y
mapperZ `
)` a
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
Ticket  
>  !
Handle" (
(( ))
UpdateStatusTicketByIdCommand) F
requestG N
,N O
CancellationTokenP a
cancellationTokenb s
)s t
{ 	
var 
ticket 
= 
_mapper  
.  !
Map! $
<$ %
Ticket% +
>+ ,
(, -
request- 4
)4 5
;5 6
var 
updatedTicket 
= 
await  %
_repository& 1
.1 2
UpdateStatusAsync2 C
(C D
ticketD J
)J K
;K L
if 
( 
updatedTicket 
==  
null! %
)% &
return 
null 
; "
HttpRequestAccountsApi "
_request# +
=, -
new. 1"
HttpRequestAccountsApi2 H
(H I
)I J
;J K
var 
user 
= 
_request 
.  
GetUserById  +
(+ ,
updatedTicket, 9
.9 :
UserId: @
)@ A
;A B
	SendEmail!! 

_sendEmail!!  
=!!! "
new!!# &
	SendEmail!!' 0
(!!0 1
)!!1 2
;!!2 3
if## 
(## 
request## 
.## 
Status## 
==## !
$str##" *
)##* +
{$$ 

_sendEmail%% 
.%% %
SendEmailStatusAndMessage%% 4
(%%4 5
request%%5 <
.%%< =
Status%%= C
,%%C D
user%%E I
,%%I J
request%%K R
.%%R S
Message%%S Z
)%%Z [
;%%[ \
}&& 
else'' 
{(( 

_sendEmail)) 
.)) 
SendEmailStatus)) *
())* +
request))+ 2
.))2 3
Status))3 9
,))9 :
user)); ?
)))? @
;))@ A
}** 
if,, 
(,, 
request,, 
.,, 
Status,, 
!=,, !
$str,," (
),,( )
{-- 
var.. 

consultant.. 
=..  
_request..! )
...) *
GetConsultantById..* ;
(..; <
updatedTicket..< I
...I J
ConsultantId..J V
)..V W
;..W X
_request// 
.// )
IncreaseNoOfTicketsConsultant// 6
(//6 7

consultant//7 A
.//A B
Id//B D
,//D E

consultant//F P
.//P Q
NumberOfTickets//Q `
)//` a
;//a b
}00 
return22 
updatedTicket22  
;22  !
}33 	
}44 
}55 ª
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
} ±
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
if 
( 
! 
listTickets 
. 
Any  
(  !
)! "
)" #
{ 
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
;n o
} 
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
} ı
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
( 
! 
listTickets 
. 
Any 
(  
)  !
)! "
{ 
throw 
new 
ArgumentException +
(+ ,
$str, T
,T U
nameofV \
(\ ]
request] d
)d e
)e f
;f g
} 
return 
listTickets 
; 
} 	
} 
}   Ü	
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
} Ø
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
if 
( 
! 
listTickets 
. 
Any 
(  
)  !
)! "
{ 
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
;d e
} 
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
} Î
|C:\Fac\SysopSquadTickets\Tickets\Application\Features\TicketFeatures\Queries\GetTicketByIdQuery\GetTicketByIdQueryHandler.cs
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
GetTicketByIdQuery6 H
{		 
public

 

class

 %
GetTicketByIdQueryHandler
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
GetTicketByIdQuery

= O
,

O P
Ticket

Q W
>

W X
{ 
private 
readonly 
ITicketRepository *
_repository+ 6
;6 7
public %
GetTicketByIdQueryHandler (
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
< 
Ticket  
>  !
Handle" (
(( )
GetTicketByIdQuery) ;
request< C
,C D
CancellationTokenE V
cancellationTokenW h
)h i
{ 	
var 
ticket 
= 
await 
_repository *
.* +
GetByIdAsync+ 7
(7 8
request8 ?
.? @
Id@ B
)B C
;C D
if 
( 
ticket 
== 
null 
) 
throw 
new 
ArgumentException +
(+ ,
$str, ?
,? @
nameofA G
(G H
requestH O
)O P
)P Q
;Q R
return 
ticket 
; 
} 	
} 
} ≥	
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
} •.
NC:\Fac\SysopSquadTickets\Tickets\Application\Helpers\HttpRequestAccountsApi.cs
	namespace 	
Application
 
. 
Helpers 
{ 
public 

class "
HttpRequestAccountsApi '
{		 
private

 
readonly

 

HttpClient

 #
client

$ *
;

* +
public "
HttpRequestAccountsApi %
(% &
)& '
{ 	
client 
= 
new 

HttpClient #
{ 
BaseAddress 
= 
new !
Uri" %
(% &
AppSettings& 1
.1 2
BaseAddress2 =
)= >
} 
; 
client 
. !
DefaultRequestHeaders (
.( )
Add) ,
(, -
$str- 9
,9 :
$str; E
)E F
;F G
client 
. !
DefaultRequestHeaders (
.( )
Accept) /
./ 0
Add0 3
(3 4
new4 7+
MediaTypeWithQualityHeaderValue8 W
(W X
$strX j
)j k
)k l
;l m
} 	
public 
User 
GetUserById 
(  
string  &
userId' -
)- .
{ 	
var 
response 
= 
client !
.! "
GetAsync" *
(* +
$str+ :
+; <
userId= C
)C D
.D E
ResultE K
;K L
response 
. #
EnsureSuccessStatusCode ,
(, -
)- .
;. /
var 
result 
= 
response !
.! "
Content" )
.) *
ReadAsAsync* 5
<5 6
User6 :
>: ;
(; <
)< =
.= >
Result> D
;D E
return 
result 
; 
} 	
public 

Consultant 
GetConsultantById +
(+ ,
string, 2
consultantId3 ?
)? @
{ 	
var 
response 
= 
client !
.! "
GetAsync" *
(* +
$str+ @
+A B
consultantIdC O
)O P
.P Q
ResultQ W
;W X
response   
.   #
EnsureSuccessStatusCode   ,
(  , -
)  - .
;  . /
var!! 
result!! 
=!! 
response!! !
.!!! "
Content!!" )
.!!) *
ReadAsAsync!!* 5
<!!5 6

Consultant!!6 @
>!!@ A
(!!A B
)!!B C
.!!C D
Result!!D J
;!!J K
return"" 
result"" 
;"" 
}## 	
public%% 

Consultant%% 
GetBestConsultant%% +
(%%+ ,
string%%, 2
category%%3 ;
,%%; <
string%%= C
location%%D L
)%%L M
{&& 	
var'' 
response'' 
='' 
client'' !
.''! "
GetAsync''" *
(''* +
$str''+ K
+''L M
category''N V
+''W X
$str''Y e
+''f g
location''h p
)''p q
.''q r
Result''r x
;''x y
response(( 
.(( #
EnsureSuccessStatusCode(( ,
(((, -
)((- .
;((. /
var)) 
result)) 
=)) 
response)) !
.))! "
Content))" )
.))) *
ReadAsAsync))* 5
<))5 6

Consultant))6 @
>))@ A
())A B
)))B C
.))C D
Result))D J
;))J K
return** 
result** 
;** 
}++ 	
public-- 
void-- '
UpdateNoOfTicketsConsultant-- /
(--/ 0
string--0 6
consultantId--7 C
,--C D
int--E H
noOfTickets--I T
)--T U
{.. 	

Consultant// 

consultant// !
=//" #
new//$ '

Consultant//( 2
{//3 4
Id//5 7
=//8 9
consultantId//: F
,//F G
NumberOfTickets//H W
=//X Y
noOfTickets//Z e
-//f g
$num//h i
}//j k
;//k l
var00 
response00 
=00 
client00 !
.00! "
PutAsJsonAsync00" 0
(000 1
$str001 E
,00E F

consultant00G Q
)00Q R
.00R S
Result00S Y
;00Y Z
response11 
.11 #
EnsureSuccessStatusCode11 ,
(11, -
)11- .
;11. /
}22 	
public44 
void44 )
IncreaseNoOfTicketsConsultant44 1
(441 2
string442 8
consultantId449 E
,44E F
int44G J
noOfTickets44K V
)44V W
{55 	

Consultant66 

consultant66 !
=66" #
new66$ '

Consultant66( 2
{663 4
Id665 7
=668 9
consultantId66: F
,66F G
NumberOfTickets66H W
=66X Y
noOfTickets66Z e
+66f g
$num66h i
}66j k
;66k l
var77 
response77 
=77 
client77 !
.77! "
PutAsJsonAsync77" 0
(770 1
$str771 E
,77E F

consultant77G Q
)77Q R
.77R S
Result77S Y
;77Y Z
response88 
.88 #
EnsureSuccessStatusCode88 ,
(88, -
)88- .
;88. /
}99 	
}:: 
};; €"
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
,) *
Body 
= 
$str %
+& '
user( ,
., -
Username- 5
+5 6
$str7 ?
+? @
$str   /
+  0 1
status  2 8
+  9 :
$str  ; A
,  A B

IsBodyHtml!! 
=!! 
true!! !
,!!! "
}"" 
;"" 
mailMessage## 
.## 
To## 
.## 
Add## 
(## 
user## #
.### $
Email##$ )
)##) *
;##* +

smtpClient%% 
.%% 
Send%% 
(%% 
mailMessage%% '
)%%' (
;%%( )
}&& 	
public(( 
void(( %
SendEmailStatusAndMessage(( -
(((- .
string((. 4
status((5 ;
,((; <
User((= A
user((B F
,((F G
string((H N
message((O V
)((V W
{)) 	
var** 
mailMessage** 
=** 
new** !
MailMessage**" -
{++ 
From,, 
=,, 
new,, 
MailAddress,, &
(,,& '
config,,' -
[,,- .
$str,,. =
],,= >
),,> ?
,,,? @
Subject-- 
=-- 
$str-- )
,--) *
Body.. 
=.. 
$str.. %
+..& '
user..( ,
..., -
Username..- 5
+..6 7
$str..8 @
+..A B
$str// /
+//0 1
status//2 8
+//9 :
$str//; A
+//A B
$str00 
+00 
message00 
+00  !
$str00" (
,00( )

IsBodyHtml11 
=11 
true11 !
,11! "
}22 
;22 
mailMessage33 
.33 
To33 
.33 
Add33 
(33 
user33 #
.33# $
Email33$ )
)33) *
;33* +

smtpClient55 
.55 
Send55 
(55 
mailMessage55 '
)55' (
;55( )
}66 	
}88 
}99 ¯
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
} 
} 