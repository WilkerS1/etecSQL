--prints "Hello World" in varchar (which is the supported var type);
print 'Hello World';

print --line breaks are ignored as usual
	'aaaaa';

print ''; --new lines are formed, the console does not seems to have a way of continuity

print  '{◦☻♀♂♣♠▒╬▼} --these characters are not usually supported and therefore not properly shown.';
print N'{◦☻♀♂♣♠▒╬▼} --implementing the N betfore the apostrophe adds support to most utf-8 characters';

declare			--declares a variable;
	@myVariable	--sets the name of this @variable (@ defines that this is a variable);
	date;		--sets the type of the variable (can be of any supported type (mandatory);
--note that variables are initialized as NULL regardless of its type.
	
select @myVariable --selects and shows a variable as an usual search method.

set @myVariable = '2018-05-30' --changes to a variable are declared as 'SET' (non case-sensitive).
--note: DATE type variables and values have the following syntax: 'YYYY-MM-DD' (with apostrophes).
select @myVariable --[...]

select @myVariable = '2018-03-31' --variables can be changed while in search methods ('SET' is replaced)
select @myVariable --[...]

declare @charvar varchar(64); --declares a VARCHAR variable (variables can be limited the same way)

set @charvar = 'H-' + 'Hewwo'; --varchars can be concatenated like in most languages
select @charvar;

select CHARINDEX('ww', @charvar) --returns an integrer value of the location of the value 'ww'
	as '"ww" is located at the position'; --an alias can be used to name the columns