import 'package:flutter/material.dart';

const loggedInKey = "LoginStatus";
const firstOpenKey = "IsFirstOpen";

const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    hintStyle: TextStyle(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryLightColor, width: 2)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 2)));

const textInputDecoration2 = InputDecoration(
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: secondaryLightColor)),
    focusedBorder:
    UnderlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: secondaryLightColor)));

const contentTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
final titleTextStyle = TextStyle(
    color: primaryDarkColor, fontSize: 18, fontWeight: FontWeight.bold);
final buttonTextStyle =
TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal);
final emptyScreenTextStyle = TextStyle(fontSize: 14, color: Colors.grey[500]);
final subtitleTextStyle = TextStyle(color: Colors.black, fontSize: 14);
final extraInfoTextStyle =
TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal);
final dialogTitleStyle = TextStyle(
    color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold);
final dialogContentStyle = TextStyle(fontSize: 12);
final dialogAffirmativeButtonStyle = TextStyle(
    color: secondaryColor, fontSize: 16, fontWeight: FontWeight.bold);
final dialogNegativeButtonStyle = TextStyle(
    color: primaryDarkColor, fontSize: 14, fontWeight: FontWeight.bold);



const primaryColor = Color(0xff283593); //Color(0xff284b70);
const primaryLightColor = Color(0xff5f5fc4); //Color(0xff366393);
const primaryDarkColor = Color(0xff001064); //Color(0xff0e2849);
const secondaryColor = Color(0xffff6f00); //Color(0xff5bcbf5);
const secondaryLightColor = Color(0xffffa040); //Color(0xffa4eaff);
const secondaryDarkColor = Color(0xffc43e00); //Color(0xff489db7);
const surfaceColor = Color(0xffffffff); //Color(0xfff0faff);
const lodadingSurfaceColor = Color(0x50283593); //Color(0x87f0faff);
const transparentSurface = Color(0xefffffff); //Color(0x87f0faff);
const errorColor = Color(0xffb00020);
const googleBlueColor = Color(0xff4285f4);
const searchBarTextColor = Color(0xffeeeeee);
const searchBarHintTextColor = Color(0xffe0e0e0);

const errorGPSPermisosMalaConexion = "Esto puede deberse a que no nos otorgaste los permisos necesarios para acceder a tu ubicación, también porque tienes el GPS apagado o porque tu GPS está presentando fallas";
const localDbName = "dropit_database.db";
const freqDestTableName = "destinations";
