?
<C:\Fac\SysopSquadTickets\Tickets\Domain\Common\BaseEntity.cs
	namespace 	
Domain
 
. 
Common 
{ 
public 

class 

BaseEntity 
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
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
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
[ 	
BsonRepresentation	 
( 
BsonType $
.$ %
ObjectId% -
)- .
]. /
public 
string 
ConsultantId "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Category 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Priority 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
DateTime- 5
.5 6
Now6 9
;9 :
} 
} ?
>C:\Fac\SysopSquadTickets\Tickets\Domain\Entities\Consultant.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 

Consultant 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public		 
byte		 
[		 
]		 
PasswordHash		 "
{		# $
get		% (
;		( )
set		* -
;		- .
}		/ 0
public

 
byte

 
[

 
]

 
PasswordSalt

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
public 
int 
NumberOfTickets "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Skill 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Availability "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int  
TotalNumberOfTickets '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
int !
SolvedNumberOfTickets (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
float 
Score 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ?
:C:\Fac\SysopSquadTickets\Tickets\Domain\Entities\Ticket.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Ticket 
: 

BaseEntity $
{% &
public 
string 
	UserEmail 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
ConsultantEmail %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public		 
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
ConsultantName

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
float 
ConsultantScore $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ?
8C:\Fac\SysopSquadTickets\Tickets\Domain\Entities\User.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
User 
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
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Location 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
byte 
[ 
] 
PasswordHash "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
byte 
[ 
] 
PasswordSalt "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
List 
< 
string 
> 
	TicketsId %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
=4 5
new6 9
List: >
<> ?
string? E
>E F
(F G
)G H
;H I
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
} 
} 