¨
LC:\Fac\SysopSquadTickets\Tickets\Persistence\Context\ApplicationDbContext.cs
	namespace 	
Persistence
 
. 
Context 
{ 
public 

class  
ApplicationDbContext %
:& '!
IApplicationDbContext( =
{ 
private 
readonly 
IMongoDatabase '
	_database( 1
;1 2
public

 
MongoClient

 
Client

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public  
ApplicationDbContext #
(# $#
ITicketDatabaseSettings$ ;
settings< D
)D E
{ 	
Client 
= 
new 
MongoClient $
($ %
settings% -
.- .
ConnectionString. >
)> ?
;? @
	_database 
= 
Client 
. 
GetDatabase *
(* +
settings+ 3
.3 4
DatabaseName4 @
)@ A
;A B
} 	
public 
IMongoCollection 
<  
T  !
>! "
GetCollection# 0
<0 1
T1 2
>2 3
(3 4
)4 5
{ 	
return 
	_database 
. 
GetCollection *
<* +
T+ ,
>, -
(- .
typeof. 4
(4 5
T5 6
)6 7
.7 8
Name8 <
+= >
$str? B
)B C
;C D
} 	
} 
} ù
NC:\Fac\SysopSquadTickets\Tickets\Persistence\Context\TicketDatabaseSettings.cs
	namespace 	
Persistence
 
. 
Context 
{ 
public 

class "
TicketDatabaseSettings '
:( )#
ITicketDatabaseSettings* A
{ 
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
DatabaseName "
{# $
get% (
;( )
set* -
;- .
}/ 0
}		 
}

 ü
CC:\Fac\SysopSquadTickets\Tickets\Persistence\DependencyInjection.cs
	namespace		 	
Persistence		
 
{

 
public 

static 
class 
DependencyInjection +
{ 
public 
static 
void 
AddPersistence )
() *
this* .
IServiceCollection/ A
servicesB J
,J K
IConfigurationL Z
configuration[ h
)h i
{ 	
services 
. 
	Configure 
< "
TicketDatabaseSettings 5
>5 6
(6 7
configuration7 D
.D E

GetSectionE O
(O P
$strP h
)h i
)i j
;j k
services 
. 
AddSingleton !
<! "#
ITicketDatabaseSettings" 9
>9 :
(: ;
sp; =
=>> @
sp 
. 
GetRequiredService %
<% &
IOptions& .
<. /"
TicketDatabaseSettings/ E
>E F
>F G
(G H
)H I
.I J
ValueJ O
)O P
;P Q
services 
. 
	AddScoped 
< !
IApplicationDbContext 4
,4 5 
ApplicationDbContext6 J
>J K
(K L
)L M
;M N
services 
. 
	AddScoped 
< 
ITicketRepository 0
,0 1
TicketRepository2 B
>B C
(C D
)D E
;E F
var 
mongoCon 
= 
configuration (
.( )

GetSection) 3
(3 4
$str4 L
)L M
[M N
$strN `
]` a
;a b
services 
. 
AddSingleton !
<! "
IMongoClient" .
>. /
(/ 0
new0 3
MongoClient4 ?
(? @
mongoCon@ H
)H I
)I J
;J K
} 	
} 
} Ãb
HC:\Fac\SysopSquadTickets\Tickets\Persistence\Repository\v1\Repository.cs
	namespace		 	
Persistence		
 
.		 

Repository		  
.		  !
v1		! #
{

 
public 

class 

Repository 
< 
TEntity #
># $
:% &
IRepository' 2
<2 3
TEntity3 :
>: ;
where< A
TEntityB I
:J K

BaseEntityL V
{ 
private 
enum 
Status 
{ 	
Open 
, 
Solved 
, 
Canceled "
} 	
;	 

private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
public 

Repository 
( !
IApplicationDbContext /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
TEntity& -
>- .
>. /
GetAllAsync0 ;
(; <
)< =
{ 	
try 
{ 
return 
await 
_context %
.% &
GetCollection& 3
<3 4
TEntity4 ;
>; <
(< =
)= >
.> ?
	FindAsync? H
(H I
entityI O
=>P R
trueS W
)W X
.X Y
ResultY _
._ `
ToListAsync` k
(k l
)l m
;m n
} 
catch 
( 
	Exception 
ex 
)  
{   
throw!! 
new!! 
ArgumentException!! +
(!!+ ,
$"!!, .#
Couldn't get entities: !!. E
{!!E F
ex!!F H
.!!H I
Message!!I P
}!!P Q
"!!Q R
)!!R S
;!!S T
}"" 
}## 	
public%% 
async%% 
Task%% 
<%% 
TEntity%% !
>%%! "
GetByIdAsync%%# /
(%%/ 0
string%%0 6
id%%7 9
)%%9 :
{&& 	
return'' 
await'' 
_context'' !
.''! "
GetCollection''" /
<''/ 0
TEntity''0 7
>''7 8
(''8 9
)''9 :
.'': ;
Find''; ?
<''? @
TEntity''@ G
>''G H
(''H I
entity''I O
=>''P R
entity''S Y
.''Y Z
Id''Z \
==''] _
id''` b
)''b c
.''c d
FirstOrDefaultAsync''d w
(''w x
)''x y
;''y z
}(( 	
public** 
async** 
Task** 
<** 
IEnumerable** %
<**% &
TEntity**& -
>**- .
>**. /
GetAllByUserIdAsync**0 C
(**C D
string**D J
userId**K Q
)**Q R
{++ 	
return,, 
await,, 
_context,, !
.,,! "
GetCollection,," /
<,,/ 0
TEntity,,0 7
>,,7 8
(,,8 9
),,9 :
.,,: ;
	FindAsync,,; D
(,,D E
entity,,E K
=>,,L N
entity,,O U
.,,U V
UserId,,V \
==,,] _
userId,,` f
),,f g
.,,g h
Result,,h n
.,,n o
ToListAsync,,o z
(,,z {
),,{ |
;,,| }
}-- 	
public// 
async// 
Task// 
<// 
IEnumerable// %
<//% &
TEntity//& -
>//- .
>//. /%
GetAllByConsultantIdAsync//0 I
(//I J
string//J P
consultantId//Q ]
)//] ^
{00 	
try11 
{22 
return33 
await33 
_context33 %
.33% &
GetCollection33& 3
<333 4
TEntity334 ;
>33; <
(33< =
)33= >
.33> ?
	FindAsync33? H
(33H I
entity33I O
=>33P R
entity33S Y
.33Y Z
ConsultantId33Z f
==33g i
consultantId33j v
)33v w
.33w x
Result33x ~
.33~ 
ToListAsync	33 ä
(
33ä ã
)
33ã å
;
33å ç
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
throw77 
new77 
ArgumentException77 +
(77+ ,
$"77, .#
Couldn't get entities: 77. E
{77E F
ex77F H
.77H I
Message77I P
}77P Q
"77Q R
)77R S
;77S T
}88 
}99 	
public;; 
async;; 
Task;; 
<;; 
IEnumerable;; %
<;;% &
TEntity;;& -
>;;- .
>;;. /
GetAllByStatusAsync;;0 C
(;;C D
string;;D J
status;;K Q
);;Q R
{<< 	
return== 
await== 
_context== !
.==! "
GetCollection==" /
<==/ 0
TEntity==0 7
>==7 8
(==8 9
)==9 :
.==: ;
	FindAsync==; D
(==D E
entity==E K
=>==L N
entity==O U
.==U V
Status==V \
====] _
status==` f
)==f g
.==g h
Result==h n
.==n o
ToListAsync==o z
(==z {
)=={ |
;==| }
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
TEntity@@ !
>@@! "
CreateAsync@@# .
(@@. /
TEntity@@/ 6
entity@@7 =
)@@= >
{AA 	
awaitBB 
_contextBB 
.BB 
GetCollectionBB (
<BB( )
TEntityBB) 0
>BB0 1
(BB1 2
)BB2 3
.BB3 4
InsertOneAsyncBB4 B
(BBB C
entityBBC I
)BBI J
;BBJ K
returnCC 
entityCC 
;CC 
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
TEntityFF !
>FF! "
UpdateAsyncFF# .
(FF. /
TEntityFF/ 6
entityFF7 =
)FF= >
{GG 	
varHH 
foundEntityHH 
=HH 
awaitHH #+
GetByUserIdAndConsultantIdAsyncHH$ C
(HHC D
entityHHD J
.HHJ K
UserIdHHK Q
,HHQ R
entityHHS Y
.HHY Z
ConsultantIdHHZ f
)HHf g
;HHg h
ifJJ 
(JJ 
foundEntityJJ 
==JJ 
nullJJ #
)JJ# $
returnKK 
nullKK 
;KK 
foundEntityMM 
.MM 
StatusMM 
=MM  
entityMM! '
.MM' (
StatusMM( .
;MM. /
foundEntityNN 
.NN 
UserIdNN 
=NN  
entityNN! '
.NN' (
UserIdNN( .
;NN. /
foundEntityOO 
.OO 
ConsultantIdOO $
=OO% &
entityOO' -
.OO- .
ConsultantIdOO. :
;OO: ;
foundEntityPP 
.PP 
PriorityPP  
=PP! "
entityPP# )
.PP) *
PriorityPP* 2
;PP2 3
awaitQQ 
_contextQQ 
.QQ 
GetCollectionQQ (
<QQ( )
TEntityQQ) 0
>QQ0 1
(QQ1 2
)QQ2 3
.QQ3 4
ReplaceOneAsyncQQ4 C
(QQC D
filterQQD J
:QQJ K
ticketQQL R
=>QQS U
ticketQQV \
.QQ\ ]
IdQQ] _
==QQ` b
foundEntityQQc n
.QQn o
IdQQo q
,QQq r
replacementQQs ~
:QQ~ 
foundEntity
QQÄ ã
)
QQã å
;
QQå ç
returnRR 
foundEntityRR 
;RR 
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU 
TEntityUU !
>UU! "
UpdateStatusAsyncUU# 4
(UU4 5
TEntityUU5 <
entityUU= C
)UUC D
{VV 	
varWW 
foundEntityWW 
=WW 
awaitWW #
GetByIdAsyncWW$ 0
(WW0 1
entityWW1 7
.WW7 8
IdWW8 :
)WW: ;
;WW; <
ifXX 
(XX 
foundEntityXX 
==XX 
nullXX #
)XX# $
returnYY 
nullYY 
;YY 
if[[ 
([[ 
entity[[ 
.[[ 
Status[[ 
!=[[ 
null[[  $
)[[$ %
{\\ 
foundEntity]] 
.]] 
Status]] "
=]]# $
entity]]% +
.]]+ ,
Status]], 2
;]]2 3
}^^ 
if`` 
(`` 
entity`` 
.`` 
Message`` 
!=``  
null``! %
)``% &
{aa 
foundEntitybb 
.bb 
Messagebb #
=bb$ %
entitybb& ,
.bb, -
Messagebb- 4
;bb4 5
foundEntitycc 
.cc 
Statuscc "
=cc# $
Statuscc% +
.cc+ ,
Solvedcc, 2
.cc2 3
ToStringcc3 ;
(cc; <
)cc< =
;cc= >
}dd 
awaitff 
_contextff 
.ff 
GetCollectionff (
<ff( )
TEntityff) 0
>ff0 1
(ff1 2
)ff2 3
.ff3 4
ReplaceOneAsyncff4 C
(ffC D
filterffD J
:ffJ K
tffL M
=>ffN P
tffQ R
.ffR S
IdffS U
==ffV X
entityffY _
.ff_ `
Idff` b
,ffb c
replacementffd o
:ffo p
foundEntityffq |
)ff| }
;ff} ~
returngg 
foundEntitygg 
;gg 
}hh 	
publicjj 
asyncjj 
Taskjj 
<jj 
booljj 
>jj 
DeleteAsyncjj  +
(jj+ ,
stringjj, 2
idjj3 5
)jj5 6
{kk 	
varll 
deleteResultll 
=ll 
awaitll $
_contextll% -
.ll- .
GetCollectionll. ;
<ll; <
TEntityll< C
>llC D
(llD E
)llE F
.llF G
DeleteOneAsyncllG U
(llU V
ticketllV \
=>ll] _
ticketll` f
.llf g
Idllg i
==llj l
idllm o
)llo p
;llp q
returnnn 
deleteResultnn 
.nn  
IsAcknowledgednn  .
&&nn/ 1
deleteResultnn2 >
.nn> ?
DeletedCountnn? K
>nnL M
$numnnN O
;nnO P
}oo 	
publicqq 
asyncqq 
Taskqq 
<qq 
TEntityqq !
>qq! "+
GetByUserIdAndConsultantIdAsyncqq# B
(qqB C
stringqqC I
userIdqqJ P
,qqP Q
stringqqR X
consultantIdqqY e
)qqe f
{rr 	
ifss 
(ss 
stringss 
.ss 
IsNullOrEmptyss $
(ss$ %
userIdss% +
)ss+ ,
||ss- /
stringss0 6
.ss6 7
IsNullOrEmptyss7 D
(ssD E
consultantIdssE Q
)ssQ R
)ssR S
returntt 
nulltt 
;tt 
varvv 
ticketvv 
=vv 
awaitvv 
_contextvv '
.vv' (
GetCollectionvv( 5
<vv5 6
TEntityvv6 =
>vv= >
(vv> ?
)vv? @
.vv@ A
FindvvA E
<vvE F
TEntityvvF M
>vvM N
(vvN O
itemvvO S
=>vvT V
itemvvW [
.vv[ \
UserIdvv\ b
==vvc e
userIdvvf l
&&vvm o
itemvvp t
.vvt u
ConsultantId	vvu Å
==
vvÇ Ñ
consultantId
vvÖ ë
)
vvë í
.
vví ì!
FirstOrDefaultAsync
vvì ¶
(
vv¶ ß
)
vvß ®
;
vv® ©
ifxx 
(xx 
ticketxx 
==xx 
nullxx 
)xx 
returnyy 
nullyy 
;yy 
return{{ 
ticket{{ 
;{{ 
}|| 	
}}} 
}~~ ¬
NC:\Fac\SysopSquadTickets\Tickets\Persistence\Repository\v1\TicketRepository.cs
	namespace 	
Persistence
 
. 

Repository  
.  !
v1! #
{ 
public 

class 
TicketRepository !
:" #

Repository$ .
<. /
Ticket/ 5
>5 6
,6 7
ITicketRepository8 I
{ 
public 
TicketRepository 
(  !
IApplicationDbContext  5
context6 =
)= >
:? @
baseA E
(E F
contextF M
)M N
{O P
}Q R
}		 
}

 