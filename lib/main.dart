import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moodworksapp/Classes/_screen.dart';
import 'Screens/login_screen.dart' as login;
import 'Screens/splashscreen_screen.dart' as splash;
import 'Screens/registerscreen_screen.dart' as register;
import 'Screens/menuSelectionscreen_screen.dart' as menu;
import 'Screens/selectDailyMoodScreen_screen.dart' as selectmood;
import 'Screens/addNotesScreen_screen.dart' as notes;
import 'Screens/editMoodScreen_screen.dart' as editmood;
import 'Screens/viewPrevScreen_screen.dart' as history;
import 'Screens/statisticsScreen_screen.dart' as statistics;
import 'Screens/pastEntriesScreen_screen.dart' as pastentries;
import 'Screens/allStatsScreen_screen.dart' as allstats;
import 'Screens/differentStatsScreen_screen.dart' as diffstats;
import 'Screens/predictionsScreen_screen.dart' as predictions;
import 'Screens/overallStatsScreen_screen.dart' as overallstats;
import 'Screens/adviceScreen_screen.dart' as advice;
import 'Screens/personalityMenuScreen_screen.dart' as personmenu;
import 'Screens/takePersonalityTestScreen_screen.dart' as test;
import 'Screens/previousResultsScreen_screen.dart' as prevres;
import 'Screens/typeDescriptionScreen_screen.dart' as typedesc;
import 'Screens/Forgotpasswordscreen_screen.dart' as forgotpassword;
import 'Screens/editProfileScreen_screen.dart' as editprofile;

void main() {
  runApp(new MaterialApp(

    home: splash.SplashScreen_screen(),
    routes: <String, WidgetBuilder>{
      "/splash" : (BuildContext context)=> new splash.SplashScreen_screen(),
      "/login"  : (BuildContext context)=> new login.LoginPage(),
      "/register"  : (BuildContext context)=> new register.Register_screen(),
      "/menu"  : (BuildContext context)=> new menu.MenuSelection_screen(),
      "/selectmood"  : (BuildContext context)=> new selectmood.SelectDailyMood_screen(),
      "/notes"  : (BuildContext context)=> new notes.AddNotes_screen(),
      "/editmood"  : (BuildContext context)=> new editmood.EditMood_screen(),
      "/history"  : (BuildContext context)=> new history.ViewPrevious_screen(),
      "/statistics"  : (BuildContext context)=> new statistics.Statistics_screen(),
      "/pastentries"  : (BuildContext context)=> new pastentries.PastEntries_screen(),
      "/advice"  : (BuildContext context)=> new advice.Advice_screen(),
      "/allstats"  : (BuildContext context)=> new allstats.AllStats_screen(),
      "/diffstats"  : (BuildContext context)=> new diffstats.DifferentStats_Screen(),
      "/predictions"  : (BuildContext context)=> new predictions.Predictions_screen(),
      "/overstats"  : (BuildContext context)=> new overallstats.OverallStats_screen(),
      "/personmenu"  : (BuildContext context)=> new personmenu.PersonalityMenu_screen(),
      "/test"  : (BuildContext context)=> new test.TakePersonalityTest(),
      "/prevres"  : (BuildContext context)=> new prevres.PreviousResults_screen(),
      "/typedesc"  : (BuildContext context)=> new typedesc.TypeDescription_screen(),
      "/forgot"  : (BuildContext context)=> new forgotpassword.forgotPassword(),
      "/editprofile"  : (BuildContext context)=> new editprofile.EditProfileScreen_screen(),
      //add more routes here
    },
  ));
}