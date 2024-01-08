import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool activeColor = false.obs;
  RxInt winnerFound = 0.obs;
  RxBool isActiveTurn = true.obs;
  RxBool oTurn = true.obs;
  RxList<String> displayXO = ['', '', '', '', '', '', '', '', ''].obs;
  RxList<dynamic> colorList = [
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
  ].obs;

  void tapped(int index) {
    if (oTurn.value && displayXO[index] == '') {
      displayXO[index] = 'O';
      isActiveTurn.value = false;
      oTurn.value = false;
    } else if (!oTurn.value && displayXO[index] == '') {
      displayXO[index] = 'X';
      isActiveTurn.value = false;
      oTurn.value = true;
    }
    checkDraw();
    checkWinner();
    return;
  }
  checkDraw(){
    if(
      displayXO[0] != ""  &&
      displayXO[1] != "" &&
      displayXO[2] != "" &&
      displayXO[3] != ""  &&
      displayXO[4] != ""  &&
      displayXO[5] != ""  &&
      displayXO[6] != ""  &&
      displayXO[7] != ""  &&
      displayXO[8] != "" 
        

      ){
        winnerFound.value = 3;

      }

  }

  checkWinner() {
    //Row
    // check 1st row
    if (displayXO[0] != '' && displayXO[1] != '' && displayXO[2] != '') {
      if (displayXO[0] == "X" && displayXO[1] == "X" && displayXO[2] == "X") {
        winnerFound.value = 1;
        // activeColor.value = true;
        colorList = [
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      } else if (displayXO[0] == "O" &&
          displayXO[1] == "O" &&
          displayXO[2] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      }
    }

    // check 2st row
    if (displayXO[3] != '' && displayXO[4] != '' && displayXO[5] != '') {
      if (displayXO[3] == "X" && displayXO[4] == "X" && displayXO[5] == "X") {
        winnerFound.value = 1;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      } else if (displayXO[3] == "O" &&
          displayXO[4] == "O" &&
          displayXO[5] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      }
    }

    // check 3st row
    if (displayXO[6] != '' && displayXO[7] != '' && displayXO[8] != '') {
      if (displayXO[6] == "X" && displayXO[7] == "X" && displayXO[8] == "X") {
        winnerFound.value = 1;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.black,
          Colors.black,
        ].obs;
      } else if (displayXO[6] == "O" &&
          displayXO[7] == "O" &&
          displayXO[8] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.black,
          Colors.black,
        ].obs;
      }
    }

    // Column
    // check 1st Column
    if (displayXO[0] != '' && displayXO[3] != '' && displayXO[6] != '') {
      if (displayXO[0] == "X" && displayXO[3] == "X" && displayXO[6] == "X") {
        winnerFound.value = 1;
        colorList = [
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      } else if (displayXO[0] == "O" &&
          displayXO[3] == "O" &&
          displayXO[6] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      }
    }

    // check 2st Column
    if (displayXO[1] != '' && displayXO[4] != '' && displayXO[7] != '') {
      if (displayXO[1] == "X" && displayXO[4] == "X" && displayXO[7] == "X") {
        winnerFound.value = 1;
        colorList = [
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
        ].obs;
      } else if (displayXO[1] == "O" &&
          displayXO[4] == "O" &&
          displayXO[7] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
        ].obs;
      }
    }

    // check 3st Column
    if (displayXO[2] != '' && displayXO[5] != '' && displayXO[8] != '') {
      if (displayXO[2] == "X" && displayXO[5] == "X" && displayXO[8] == "X") {
        winnerFound.value = 1;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
        ].obs;
      } else if (displayXO[2] == "O" &&
          displayXO[5] == "O" &&
          displayXO[8] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
        ].obs;
      }
    }

    //Cross Check 1
    if (displayXO[0] != '' && displayXO[4] != '' && displayXO[8] != '') {
      if (displayXO[0] == "X" && displayXO[4] == "X" && displayXO[8] == "X") {
        winnerFound.value = 1;
        colorList = [
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
        ].obs;
      } else if (displayXO[0] == "O" &&
          displayXO[4] == "O" &&
          displayXO[8] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
        ].obs;
      }
    }

    //Cross Check 2
    if (displayXO[2] != '' && displayXO[4] != '' && displayXO[6] != '') {
      if (displayXO[2] == "X" && displayXO[4] == "X" && displayXO[6] == "X") {
        winnerFound.value = 1;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      } else if (displayXO[2] == "O" &&
          displayXO[4] == "O" &&
          displayXO[6] == "O") {
        winnerFound.value = 2;
        colorList = [
          Colors.grey[300],
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.black,
          Colors.grey[300],
          Colors.grey[300],
        ].obs;
      }
    }
  }

  restartButton() {
    winnerFound.value = 0;
    isActiveTurn.value = true;
    oTurn.value = false;
    displayXO = ['', '', '', '', '', '', '', '', ''].obs;
    colorList = [
      Colors.grey[300],
      Colors.grey[300],
      Colors.grey[300],
      Colors.grey[300],
      Colors.grey[300],
      Colors.grey[300],
      Colors.grey[300],
      Colors.grey[300],
      Colors.grey[300],
    ].obs;
  }
}
