@IsTest
private with sharing class MyTestClass {

 @TestSetup
 private static void createMyTestData(){

 }
 
 @IsTest
 private static void myTestMethod1(){
 // test data defined in the method createMyTestData is created before the execution of this unit test
 }

 @IsTest
 private static void myTestMethod2(){
 // test data defined in the method createMyTestData is created before the execution of this unit test
 }
}