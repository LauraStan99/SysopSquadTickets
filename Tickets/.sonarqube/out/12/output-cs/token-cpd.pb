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
} Û]
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
private 
readonly !
IApplicationDbContext .
_context/ 7
;7 8
public 

Repository 
( !
IApplicationDbContext /
context0 7
)7 8
{ 	
_context 
= 
context 
; 
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
TEntity& -
>- .
>. /
GetAllAsync0 ;
(; <
)< =
{ 	
try 
{ 
return 
await 
_context %
.% &
GetCollection& 3
<3 4
TEntity4 ;
>; <
(< =
)= >
.> ?
	FindAsync? H
(H I
entityI O
=>P R
trueS W
)W X
.X Y
ResultY _
._ `
ToListAsync` k
(k l
)l m
;m n
} 
catch 
( 
	Exception 
ex 
)  
{ 
throw 
new 
ArgumentException +
(+ ,
$", .#
Couldn't get entities: . E
{E F
exF H
.H I
MessageI P
}P Q
"Q R
)R S
;S T
} 
} 	
public   
async   
Task   
<   
TEntity   !
>  ! "
GetByIdAsync  # /
(  / 0
string  0 6
id  7 9
)  9 :
{!! 	
return"" 
await"" 
_context"" !
.""! "
GetCollection""" /
<""/ 0
TEntity""0 7
>""7 8
(""8 9
)""9 :
."": ;
Find""; ?
<""? @
TEntity""@ G
>""G H
(""H I
entity""I O
=>""P R
entity""S Y
.""Y Z
Id""Z \
==""] _
id""` b
)""b c
.""c d
FirstOrDefaultAsync""d w
(""w x
)""x y
;""y z
}## 	
public%% 
async%% 
Task%% 
<%% 
IEnumerable%% %
<%%% &
TEntity%%& -
>%%- .
>%%. /
GetAllByUserIdAsync%%0 C
(%%C D
string%%D J
userId%%K Q
)%%Q R
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
.'': ;
	FindAsync''; D
(''D E
entity''E K
=>''L N
entity''O U
.''U V
UserId''V \
==''] _
userId''` f
)''f g
.''g h
Result''h n
.''n o
ToListAsync''o z
(''z {
)''{ |
;''| }
}(( 	
public** 
async** 
Task** 
<** 
IEnumerable** %
<**% &
TEntity**& -
>**- .
>**. /%
GetAllByConsultantIdAsync**0 I
(**I J
string**J P
consultantId**Q ]
)**] ^
{++ 	
try,, 
{-- 
return.. 
await.. 
_context.. %
...% &
GetCollection..& 3
<..3 4
TEntity..4 ;
>..; <
(..< =
)..= >
...> ?
	FindAsync..? H
(..H I
entity..I O
=>..P R
entity..S Y
...Y Z
ConsultantId..Z f
==..g i
consultantId..j v
)..v w
...w x
Result..x ~
...~ 
ToListAsync	.. ä
(
..ä ã
)
..ã å
;
..å ç
}// 
catch00 
(00 
	Exception00 
ex00 
)00  
{11 
throw22 
new22 
ArgumentException22 +
(22+ ,
$"22, .#
Couldn't get entities: 22. E
{22E F
ex22F H
.22H I
Message22I P
}22P Q
"22Q R
)22R S
;22S T
}33 
}44 	
public66 
async66 
Task66 
<66 
IEnumerable66 %
<66% &
TEntity66& -
>66- .
>66. /
GetAllByStatusAsync660 C
(66C D
string66D J
status66K Q
)66Q R
{77 	
return88 
await88 
_context88 !
.88! "
GetCollection88" /
<88/ 0
TEntity880 7
>887 8
(888 9
)889 :
.88: ;
	FindAsync88; D
(88D E
entity88E K
=>88L N
entity88O U
.88U V
Status88V \
==88] _
status88` f
)88f g
.88g h
Result88h n
.88n o
ToListAsync88o z
(88z {
)88{ |
;88| }
}99 	
public;; 
async;; 
Task;; 
<;; 
TEntity;; !
>;;! "
CreateAsync;;# .
(;;. /
TEntity;;/ 6
entity;;7 =
);;= >
{<< 	
await== 
_context== 
.== 
GetCollection== (
<==( )
TEntity==) 0
>==0 1
(==1 2
)==2 3
.==3 4
InsertOneAsync==4 B
(==B C
entity==C I
)==I J
;==J K
return>> 
entity>> 
;>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
TEntityAA !
>AA! "
UpdateAsyncAA# .
(AA. /
TEntityAA/ 6
entityAA7 =
)AA= >
{BB 	
varCC 
foundEntityCC 
=CC 
awaitCC #+
GetByUserIdAndConsultantIdAsyncCC$ C
(CCC D
entityCCD J
.CCJ K
UserIdCCK Q
,CCQ R
entityCCS Y
.CCY Z
ConsultantIdCCZ f
)CCf g
;CCg h
ifEE 
(EE 
foundEntityEE 
==EE 
nullEE #
)EE# $
returnFF 
nullFF 
;FF 
foundEntityHH 
.HH 
StatusHH 
=HH  
entityHH! '
.HH' (
StatusHH( .
;HH. /
foundEntityII 
.II 
UserIdII 
=II  
entityII! '
.II' (
UserIdII( .
;II. /
foundEntityJJ 
.JJ 
ConsultantIdJJ $
=JJ% &
entityJJ' -
.JJ- .
ConsultantIdJJ. :
;JJ: ;
foundEntityKK 
.KK 
PriorityKK  
=KK! "
entityKK# )
.KK) *
PriorityKK* 2
;KK2 3
awaitLL 
_contextLL 
.LL 
GetCollectionLL (
<LL( )
TEntityLL) 0
>LL0 1
(LL1 2
)LL2 3
.LL3 4
ReplaceOneAsyncLL4 C
(LLC D
filterLLD J
:LLJ K
ticketLLL R
=>LLS U
ticketLLV \
.LL\ ]
IdLL] _
==LL` b
foundEntityLLc n
.LLn o
IdLLo q
,LLq r
replacementLLs ~
:LL~ 
foundEntity
LLÄ ã
)
LLã å
;
LLå ç
returnMM 
foundEntityMM 
;MM 
}NN 	
publicPP 
asyncPP 
TaskPP 
<PP 
TEntityPP !
>PP! "
UpdateStatusAsyncPP# 4
(PP4 5
TEntityPP5 <
ticketPP= C
)PPC D
{QQ 	
varRR 
entityRR 
=RR 
awaitRR 
GetByIdAsyncRR +
(RR+ ,
ticketRR, 2
.RR2 3
IdRR3 5
)RR5 6
;RR6 7
ifSS 
(SS 
entitySS 
==SS 
nullSS 
)SS 
returnTT 
nullTT 
;TT 
entityVV 
.VV 
StatusVV 
=VV 
ticketVV "
.VV" #
StatusVV# )
;VV) *
ifWW 
(WW 
ticketWW 
.WW 
MessageWW 
!=WW  
nullWW! %
)WW% &
{XX 
entityYY 
.YY 
MessageYY 
=YY  
ticketYY! '
.YY' (
MessageYY( /
;YY/ 0
}ZZ 
await\\ 
_context\\ 
.\\ 
GetCollection\\ (
<\\( )
TEntity\\) 0
>\\0 1
(\\1 2
)\\2 3
.\\3 4
ReplaceOneAsync\\4 C
(\\C D
filter\\D J
:\\J K
t\\L M
=>\\N P
t\\Q R
.\\R S
Id\\S U
==\\V X
entity\\Y _
.\\_ `
Id\\` b
,\\b c
replacement\\d o
:\\o p
entity\\q w
)\\w x
;\\x y
return]] 
entity]] 
;]] 
}^^ 	
public`` 
async`` 
Task`` 
<`` 
bool`` 
>`` 
DeleteAsync``  +
(``+ ,
string``, 2
id``3 5
)``5 6
{aa 	
varbb 
deleteResultbb 
=bb 
awaitbb $
_contextbb% -
.bb- .
GetCollectionbb. ;
<bb; <
TEntitybb< C
>bbC D
(bbD E
)bbE F
.bbF G
DeleteOneAsyncbbG U
(bbU V
ticketbbV \
=>bb] _
ticketbb` f
.bbf g
Idbbg i
==bbj l
idbbm o
)bbo p
;bbp q
returndd 
deleteResultdd 
.dd  
IsAcknowledgeddd  .
&&dd/ 1
deleteResultdd2 >
.dd> ?
DeletedCountdd? K
>ddL M
$numddN O
;ddO P
}ee 	
publicgg 
asyncgg 
Taskgg 
<gg 
TEntitygg !
>gg! "+
GetByUserIdAndConsultantIdAsyncgg# B
(ggB C
stringggC I
userIdggJ P
,ggP Q
stringggR X
consultantIdggY e
)gge f
{hh 	
ifii 
(ii 
stringii 
.ii 
IsNullOrEmptyii $
(ii$ %
userIdii% +
)ii+ ,
||ii- /
stringii0 6
.ii6 7
IsNullOrEmptyii7 D
(iiD E
consultantIdiiE Q
)iiQ R
)iiR S
returnjj 
nulljj 
;jj 
varll 
ticketll 
=ll 
awaitll 
_contextll '
.ll' (
GetCollectionll( 5
<ll5 6
TEntityll6 =
>ll= >
(ll> ?
)ll? @
.ll@ A
FindllA E
<llE F
TEntityllF M
>llM N
(llN O
itemllO S
=>llT V
itemllW [
.ll[ \
UserIdll\ b
==llc e
userIdllf l
&&llm o
itemllp t
.llt u
ConsultantId	llu Å
==
llÇ Ñ
consultantId
llÖ ë
)
llë í
.
llí ì!
FirstOrDefaultAsync
llì ¶
(
ll¶ ß
)
llß ®
;
ll® ©
ifnn 
(nn 
ticketnn 
==nn 
nullnn 
)nn 
returnoo 
nulloo 
;oo 
returnqq 
ticketqq 
;qq 
}rr 	
}ss 
}tt ¬
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
}		 	
}

 
} 