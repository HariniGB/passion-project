User.destroy_all
Game.destroy_all
Guess.destroy_all
Option.destroy_all
Quiz.destroy_all
Topic.destroy_all


user1 = User.new(first_name: "Harini", last_name: "Bala", email: "test@gmail.com")
user1.password = "test"
# Creates a new game when the user selects the play button.
user1.save

user2 = User.new(first_name: "Fei", last_name: "Li", email: "lfangfeili@gmail.com")
user2.password = "xxx"
user2.save
#===============================================================================================================
game = Game.create(user_id: user1.id, score: 0)
#===============================================================================================================
# There are in total 10 topics.
topics = ["Entertainment", "Geography", "Mathematics", "Sports", "Technology", "Ruby", "HTML", "jQuery", "CSS", "JavaScript"]
topics.each do |topic|
  Topic.create(topic_name: "#{topic}")
end

#===============================================================================================================
# Add all the quizzes under each topic.

## TOPIC 1
questions1 =["A new series of the panel game I'm Sorry I Haven't a Clue began on 15th June 2009 on BBC Radio 4. Who was chairman?", "In the 2009 Big Brother series, what is the profession of housemate Angel?", "What is the name of Sir Alan Sugar's sidekick on The Apprentice, who announced in June 2009 she'd be leaving the show?", "Denzil Washington stars in the 2009 film The Taking of Pelham 123. What is Pelham 123?", "Take That commenced their 2009 stadium tour on 6th June at which venue?", "In June 2009 Michael Jackson announced that for his forthcoming London concerts he wants a children's choir with each child capable of doing what?", "The Tony Awards were staged in June 2009 at which New York City venue?
", "Which celebrity chef apologised in June 2009 for likening an Australian TV presenter to a pig?", "A prison photograph released in June 2009 shows the 'Wall of Sound' pioneer Phil Spector without his what?
", " Who released the June 2009 single Did You See Me Coming?"]

answers1 = ["Stephen Fry","Boxer","Margaret Mountford","A subway train", "Stadium of Light", "Read sign language", "Radio City Music Hall", "Gordon Ramsay", "Wig", "Pet Shop Boys"]

options1 = [["Stephen Fry","Ian Hislop","Paul Merton","Arthur Smith"],
["Bricklayer", "Boxer", "Welder","Wrestler"],
["Margaret Mansfield","Margaret Mountford","Margaret Retford","Margaret Rutherford"],
["An airliner", "A nuclear bomb","A subway train","A virus"],
["Anfield","Old Trafford","Stadium of Light","White Hart Lane"],
["Juggle","Play the xylophone","Read sign language","Sing in Swahili"],
["George Gershwin Theater","Hammerstein Ballroom","Radio City Music Hall","Union Square Theater"],
["Nigella Lawson", "Gordon Ramsay", "Delia Smith", "Phil Vickery"],
["Eyebrows", "Shirt","Teeth","Wig"],
["Black Eyed Peas","Empire of the Sun","Pet Shop Boys
"]]

questions1.each_index do |i|
  quiz1 = Quiz.create(question: questions1[i], answer: answers1[i], weight: rand(1..5), topic_id: 1)
  options1[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz1.id)
  end
end

#===============================================================================================================

questions2 = ["What conditions are required for the ice crystal formation known as diamond dust?","How deep is the atmosphere that surrounds the Earth?","Air pressure is otherwise known as what?","Long-distance aircraft usually fly in which layer of the atmosphere?","As far as the weather is concerned, what is the most important gas in the atmosphere?"," The currents of which ocean produce the El Nino effect?","The sky looks blue because light is scattered by what?","How long ago did the last ice age peak?","Precipitation is a word used to describe what?","Ash coming into leaf before Oak is supposed to signify what?"]

answers2 =["Very cold and dry","About 400 miles","Atmospheric pressure","In the higher troposphere","Water vapour","Pacific","Gas molecules and dust particles","Approximately 20,000 years ago","Rain, snow and hail","It will be a wet summer"]

options2 = [["Very cold and dry","Very windy","Very humid","Very calm"],
["About 50 miles","About 100 miles","About 400 miles","About 1,000 miles"],
["Atmospheric weight","Atmosphere weight","Atmosphere pressure","Atmospheric pressure"],
["In the lower troposphere","In the higher troposphere","In the stratosphere","In the exosphere"],
["Oxygen","Water vapour","Nitrogen","Helium"],
["Indian","Atlantic","Pacific","Arctic"],
["Ice Crystals","Ozone","Gas molecules and dust particles","Water droplets"],
["Approximately 20,000 years ago","Approximately 200,000 years ago","Approximately 2 million years ago","Approximately 20 million years ago"],
["Wind","Atmospheric pressure","Rain, snow and hail","Humidity"],
["It will be a wet summer","It will be a dry summer","It will be a hot summer","It will be a cold summer"]]

questions2.each_index do |i|
  quiz2 = Quiz.create(question: questions2[i], answer: answers2[i], weight: rand(1..5), topic_id: 2)
  options2[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz2.id)
  end
end

#===============================================================================================================
questions3 = ["What is the sum of the angles within a triangle?","What is derived by use of the formula ?r²?
","What are lines called which always have the same distance between them?","What mathematical function is represented by the / symbol?","Which numerical system only uses the chracters 0 and 1?","What nationality was the legendary mathematician Pythagoras?","Which line joins the centre to any point on a circle's circumference?","How many right angles are contained within a rectangle?","How many sides does a pentagon have?"," Mean, Median and Mode are types of what?"]


answers3 = ["180 degrees","Area of a circle
","Parallel","Division","Binary","Greek","Radius","4","5","Descriptive Statistics"]

options3 = [["90 degrees","120 degrees","180 degrees","360 degrees"],
["Area of a circle","Length of a tangent","Volume of a pyramid","Width of a rhombus "],
["Convergent","Equilateral","Infinite","Parallel
"],
["Average","Division","Reciprocal","Sum"],
["Basic","Binary","Cardinal","Hexadecimal"],
["Babylonian","Egyptian","Greek","Roman"],
["Diameter","Radius","Tangent","Vector"],
["4","8","16","64"],
["4","5","8","15"],
["Descriptive Statistics","Calculation","Equation","Formula"]]


questions3.each_index do |i|
  quiz3 = Quiz.create(question: questions3[i], answer: answers3[i], weight: rand(1..5), topic_id: 3)
  options3[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz3.id)
  end
end

#===============================================================================================================
questions4=  ["Which Premiership football club plays its home games at White Hart Lane?","Which English footballer scored a great goal against Argentina in the 1998 World Cup?"," Who was England's chief coach at the 2006 FIFA World Cup ?","What are Bristol's two football clubs called?"," What colour are the home shirts of Everton Football Club?","Which country did footballer Kenny Dalglish represent?","Which country won its fifth football World Cup in 2002?","Which of these football clubs is not based in Lancashire?","'The Wizard Of Dribble', which Stanley was a famous England footballer?","Which footballer was known as 'Gazza'?"]

answers4 =["Tottenham Hotspur","Michael Owen","Sven Goran Eriksson","City and Rovers","Blue","Scotland","Brazil","Barnsley","Matthews","Paul Gascoigne"]

options4 =[["Arsenal","Chelsea","Tottenham Hotspur","West Ham United"],
["Glenn Hoddle","Ian Wright","Les Ferdinand","Michael Owen"],
["Arsene Wenger","Glenn Hoddle","Kevin Keegan","Sven Goran Eriksson"],
["Athletic and City","City and Rovers","Rovers and United","United and Wanderers"],
["Blue","Green and White Hoops","Red","Yellow and Black
"],
["England","Northern Ireland","Scotland","Wales"],
["Brazil","Germany","Italy","Uruguay"],
["Barnsley","Blackburn Rovers","Blackpool","Burnley
"],
["Baldwin","Holloway","Laurel","Matthews"],
["Gary Lineker","Gary Mabbutt","Gary Speed","Paul Gascoigne"]]

questions4.each_index do |i|
  quiz4 = Quiz.create(question: questions4[i], answer: answers4[i], weight: rand(1..5), topic_id: 4)
  options4[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz4.id)
  end
end

#===============================================================================================================

questions5 = [" Which famous scientist is associated with the three laws of motion?","Which is the lightest chemical element?","What was the name of the world's first jet airliner, that first carried paying passengers in 1952?","What type of acid is normally used in car batteries?","Which Hawker Siddeley fighter aircraft is nicknamed the Jump Jet?","In the process of galvanization, iron or steel is coated with a thin layer of which other metal?","Which metal is found primarily in bauxite ore?"," Which French scientist co-developed the aqua-lung?","Which device in the modern car allows each of the driving wheels to rotate at different speeds?","What name is given to the science of projectiles?"]

answers5 = ["Isaac Newton","Hydrogen","Comet","Sulphuric","Harrier","Zinc","Aluminium","Jacques Cousteau","The differential","Ballistics"]

options5 = [["Albert Einstein","Stephen Hawking","Isaac Newton","James Watt"],
["Helium","Hydrogen","Lithium","Oxygen"],
["Asteroid","Comet","Meteor","Planet"],
["Acetic","Hydrochloric","Nitric","Sulphuric"],
["Harrier","Hawk","Hornet","Hunter"],
["Copper","Nickel","Silver","Zinc"],
["Aluminium","Copper","Lead","Tin"],
["Jacques Cousteau","Antoine Lavoisier","Blaise Pascal","Louis Pasteur"],
["The carburretor","The crankshaft","The differential","The distributor"],
["Ballistics","Dynamics","Fluidics","Hydraulics"]]

questions5.each_index do |i|
  quiz5 = Quiz.create(question: questions5[i], answer: answers5[i], weight: rand(1..5), topic_id: 5)
  options5[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz5.id)
  end
end

#===============================================================================================================
questions6 = ["Ruby is what kind of programming language?","The following is a primitive type in Ruby","Variables that start with two '@' symbols are what kind of variables in Ruby","Variables that start with a capital letter are what kind of variables in Ruby","Variables that start a dollar sign are what kind of variables in Ruby","Which of the following correctly applies an assignment operator to simplify the code below? count = count * 2"," Which of the following will loop from 1 to 20 including 20.","Which of the following best describes the next keyword?"]

answers6 = ["Strongly typed/Dynamically typed","None of the above","Class variable","Constant  variable","Global variable","count *= 2","for num 1 .. 20","it can skip over certain iterations in a loop"]

options6 = [["Strongly typed/Statically typed","Strongly typed/Dynamically typed","Weakly typed/Statically typed","Weakly typed/Dynamically typed"],
["Integer","String","Float","None of the above"],
["Local variable","Global variable","Instance variable","Class variable"],
["Local variable","Constant  variable","Instance variable","Class variable"],
["Local variable","Global variable","Instance variable","Class variable"],
["count =* 2","count +2= count","count 2*= count","count *= 2"],
["for num 1 ... 20","for num 1 .. 21","for num 1 .. 20","None of the above"],
["it can only break a loop once","it can skip over certain iterations in a loop","it skips to the next loop in the code","it incriments a loop by one automatically"]]

questions6.each_index do |i|
  quiz6 = Quiz.create(question: questions6[i], answer: answers6[i], weight: rand(1..5), topic_id: 6)
  options6[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz6.id)
  end
end

#===============================================================================================================

questions7 =["The common element which describe the web page, is ?"," HTML stands for?","which of the following tag is used to mark a begining of paragraph ?","From which tag descriptive list starts ?"," Correct HTML tag for the largest heading is","The attribute of <form> tag"," www is based on which model?","Which of the following attributes of text box control allow to limit the maximum character?"]

answers7 =["All of these","Hyper Text Markup Language","<P>","<DL>","<h1>","Both (a)&(b)","Client-server","maxlength"]

options7 =[["heading","paragraph","list","All of these"],["Hyper Text Markup Language","High Text Markup Languag","Hyper Tabular Markup Languag","None of these"],["<TD>","<br>","<P>","<TR>"],["<LL>","<DD>","<DL>","<DS>"],["<head>","<h6>","<heading>","<h1>"],["Method","Action","Both (a)&(b)","None of these"],["Local-server","Client-server","3-tier","None of these"],["size","len","maxlength","all of these"]]


questions7.each_index do |i|
  quiz7 = Quiz.create(question: questions7[i], answer: answers7[i], weight: rand(1..5), topic_id: 7)
  options7[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz7.id)
  end
end

#===============================================================================================================
questions8 =["Can you pass a anonymous function as an argument to another function?"," Which of the following is correct about callbacks?","Which of the following jQuery selector selects element with the given element id some-id?","Which of the following jQuery method sets attributes of an element?","Which of the following jQuery method adds more elements, matched by the given selector, to the set of matched elements?","Which of the following jQuery method gets a set of elements containing the closest parent element that matches the specified selector, the starting element included?","Which of the following jQuery method sets the style property of an element?","Q 8 - Which of the following jQuery method returns a jQuery collection with the positioned parent of the first matched element?","Which of the following jQuery method can be used to make a ajax call?","Which of the following jQuery method serializes a set of input elements into a string of data?"]

answers8 = ["true","Both of the above","$('#some-id')","attr(name, value)","add( selector )","closest(selector)","css( name, value )","offsetParent( )","load( url, [data], [callback] )","serialize( )"]

options8 =[["true","false"],
[" A callback is a plain JavaScript function passed to some method as an argument or option.","Some callbacks are just events, called to give the user a chance to react when a certain state is triggered.","Both of the above.","None of the above."],
["$('some-id')","$('#some-id')","$('.some-id')","None of the above."],
["attr(name, value)","setAttr(name, value)","setAttributes(name, value)","None of the above."],
["add( selector )","addElement( selector )","append(selector)","None of the above."],
["getNearest( selector )","getClosest( [selector])","closest(selector)","None of the above."],
["setClass( name, value )","setStyle( name, value)","css( name, value )","None of the above."],
["offset( )","offsetParent( )","position( )","None of the above."],
["ready(url, [data], [callback] )","load( url, [data], [callback] )","reload(url, [data], [callback] )
","None of the above"],
[" jQuery.ajax( options )","jQuery.ajaxSetup( options )","serialize( )","serializeArray( )"]]

questions8.each_index do |i|
  quiz8 = Quiz.create(question: questions8[i], answer: answers8[i], weight: rand(1..5), topic_id: 8)
  options8[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz8.id)
  end
end
#===============================================================================================================
questions9 = ["Which of the following is correct about CSS?"," Which of the following defines a measurement in inches?","Which of the following is correct about RGB Values format of CSS colors?","Which of the following is correct about Browser Safe Colors?","Which of the following property is used to increase or decrease the size of a font?","Which of the following property is used to set the text shadow around a text?","Which of the following property of a table element specifies the width that should appear between table cells?","Which of the following property changes the style of left border?","Which of the following property specifies an image for the marker rather than a bullet point or number?"," Which of the following value of cursor shows it as an arrow?"]

answers9 = ["All of the above","in","All of the above","All of the above","font-size","text-shadow",":border-spacing",":border-left-style","ist-style-image","default"]

options9 =[["Style sheets allow content to be optimized for more than one type of device.","CSS can store web applications locally with the help of an offline catche.","Using CSS, we can view offline websites.The cache also ensures faster loading and better overall performance of the website.","All of the above."],
["in","mm","pc","pt"],
["This color value is specified using the rgb( ) property.","This property takes three values, one each for red, green, and blue.","The value can be an integer between 0 and 255 or a percentage.","All of the above."],
[" These are 216 colors which are supposed to be most safe and computer independent colors.","These colors vary from hexa code 000000 to FFFFFF.","These colors are safe to use because they ensure that all computers would display the colors correctly when running a 256 color palette.","All of the above"],
["font-size","font","font-variant","font-weight"],
["white-space","text-shadow","text-decoration","text-transform"],
[" :border-collapse",":border-spacing",":caption-side",":empty-cells"],
[":border-bottom-style",":border-top-style",":border-left-style",":border-right-style"],
["list-style-type","list-style-position","list-style-image","list-style"],
["crosshair","default","pointer","move"]]


questions9.each_index do |i|
  quiz9 = Quiz.create(question: questions9[i], answer: answers9[i], weight: rand(1..5), topic_id: 9)
  options9[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz9.id)
  end
end
#===============================================================================================================

questions10 = ["Can you access Cookie using javascript?","Which of the following type of variable is visible everywhere in your JavaScript code?","Which built-in method calls a function for each element in the array?","Which built-in method returns the calling string value converted to upper case?","Which of the following function of Number object defines how many total digits to display of a number?","Which of the following function of String object extracts a section of a string and returns a new string?","Which of the following function of String object creates a string to be displayed in a big font as if it were in a <big> tag?","Which of the following function of String object causes a string to be displayed in the specified color as if it were in a <font color='color'> tag?","Which of the following function of Array object returns true if every element in this array satisfies the provided testing function?","Which of the following function of Array object adds one or more elements to the front of an array and returns the new length of the array?"]

answers10 = ["true
","global variable","forEach()","toUpperCase()","toPrecision()","slice()","big()","fontcolor()","every()","unshift()"]

options10 = [["true","false"],
["global variable","local variable","Both of the above.","None of the above."],
["while()","loop()","forEach()","None of the above."],
["toUpperCase()","toUpper()","changeCase(case)","None of the above"],
[" toExponential()","toFixed()","toLocaleString()","toPrecision()"],
["slice()","split()","replace()","search()"],
["anchor()","big()","blink()","italics()"],
["fixed()","fontcolor()","blink()","bold()"],
["concat()","every()","push()","some()"],
["unshift()","sort()","splice()","toString()"]]

questions10.each_index do |i|
  quiz10 = Quiz.create(question: questions10[i], answer: answers10[i], weight: rand(1..5), topic_id: 10)
  options10[i].each do |opt|
     Option.create(option: opt, quiz_id: quiz10.id)
  end
end
#===============================================================================================================

# Each guesses row is added when a user selects an answer. Points are from 1-5 for right answer.
Guess.create(point: 3, guess_body: "Stephen Fry", game_id: game.id, quiz_id: 1)
Guess.create(point: 5, guess_body: "Boxer" , game_id: game.id, quiz_id: 2)
Guess.create(point: 2, guess_body: "Margaret Mountford", game_id: game.id, quiz_id: 3)
Guess.create(point: 3, guess_body: "A subway train", game_id: game.id, quiz_id: 4)
# .score method is to calculate the sum of points in guesses table and save it as score in game table.
game.score
game.save
