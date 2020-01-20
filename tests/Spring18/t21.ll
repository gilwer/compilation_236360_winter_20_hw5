; saves: print
; saves: printi
; saves: w
; saves: x
; saves: c
; saves: y
; ID.str : w
; ID.str : x
; ID.str : c
; ---end scope---
; ---end scope---
; ID.str : y
; ---end scope---
; w INT -1
; x BYTE -2
; c BOOL -3
; y INT -4
; saves: foo
; saves: x
; saves: y
; saves: z
; ID.str : x
; ID.str : y
; ID.str : z
; ID.str : x
; ID.str : x
; ID.str : y
; ID.str : x
; ID.str : x
; ID.str : y
; ---end scope---
; x BYTE 0
; y BYTE 1
; z BOOL 2
; saves: main
; ---end scope---
; print (STRING)->VOID 0
; printi (INT)->VOID 0
; foo (INT,BYTE,BOOL,INT)->INT 0
; main ()->VOID 0
@.str_specifier = constant [4 x i8] c"%s\0A\00"
@.int_specifier = constant [4 x i8] c"%d\0A\00"
@.zero_division = constant [23 x i8] c"Error division by zero\00"
@.temp7 = constant [5x i8] c"true\00"
@.temp8 = constant [6x i8] c"false\00"
declare i32 @printf(i8*, ...)
declare void @exit(i32)
define void @printi(i32) {
call i32 (i8*, ...) @printf(i8* getelementptr ([4 x i8], [4 x i8]* @.int_specifier, i32 0, i32 0), i32 %0)
ret void
}
define void @print(i8*) {
call i32 (i8*, ...) @printf(i8* getelementptr ([4 x i8], [4 x i8]* @.str_specifier, i32 0, i32 0), i8* %0)
ret void
}
define i32 @foo(i32 %arg0, i32 %arg1, i1 %arg2, i32 %arg3) {
%retvar = alloca i32
store i32 0, i32* %retvar
br label %label_53
foo.return:
%temp1 = load i32, i32* %retvar 
ret i32 %temp1
label_17:
%temp2 = load i32, i32* %varw
call void @printi(i32 %temp2)
%temp3 = load i32, i32* %varx
call void @printi(i32 %temp3)
%temp4 = load i32, i32* %varc
%temp5 = trunc i32 %temp4 to i1
%temp6 =  icmp eq i1 true, %temp5
br i1 %temp6, label %label_27, label %label_37
br label %label_31
label_27:
call void @print(i8* getelementptr ([5 x i8], [5 x i8]* @.temp7, i32 0, i32 0))
br label %label_42
br label %label_33
label_31:
br label %label_27
label_33:
br label %label_40
label_35:
br label %label_37
label_37:
call void @print(i8* getelementptr ([6 x i8], [6 x i8]* @.temp8, i32 0, i32 0))
br label %label_42
label_40:
br label %label_35
label_42:
%temp9 = load i32, i32* %vary
call void @printi(i32 %temp9)
%temp10 = add i32 0, 0
store i32 %temp10, i32* %retvar
br label %foo.return
br label %foo.return
foo.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %foo.return
label_53:
%varw = alloca i32
store i32 %arg0, i32* %varw
%varx = alloca i32
store i32 %arg1, i32* %varx
%varc = alloca i32
%temp11 = zext i1 %arg2 to i32
store i32 %temp11, i32* %varc
%vary = alloca i32
store i32 %arg3, i32* %vary
br label %label_17
}
define void @main() {
br label %label_150
main.return:
ret void
label_69:
%temp12 = add i32 0, 5
%temp13 = add i32 0, 6
br label %label_74
%temp14 = add i32 0, 10
label_74:
br label %label_78
label_76:
br label %label_78
label_78:
%temp15 = phi i1 [ true, %label_74 ], [ false, %label_76 ]
%temp16 = call i32 @foo(i32 %temp12, i32 %temp13, i1 %temp15, i32 %temp14)
%temp17 = add i32 0, 2
%temp18 = add i32 0, 5
br label %label_87
%temp19 = add i32 0, 11
label_85:
br label %label_89
label_87:
br label %label_89
label_89:
%temp20 = phi i1 [ true, %label_85 ], [ false, %label_87 ]
%temp21 = call i32 @foo(i32 %temp17, i32 %temp18, i1 %temp20, i32 %temp19)
%temp22 = add i32 0, 88
store i32 %temp22, i32* %varx
%temp23 = add i32 0, 0
store i32 %temp23, i32* %vary
br label %label_97
label_97:
br label %label_101
label_99:
br label %label_101
label_101:
%temp24 = phi i1 [ true, %label_97 ], [ false, %label_99 ]
%temp25 = zext i1 %temp24 to i32
store i32 %temp25, i32* %varz
%temp26 = load i32, i32* %varx
%temp27 = load i32, i32* %vary
%temp28 = load i32, i32* %varz
%temp29 = trunc i32 %temp28 to i1
%temp30 =  icmp eq i1 true, %temp29
br i1 %temp30, label %label_112, label %label_114
%temp31 = load i32, i32* %varx
label_112:
br label %label_116
label_114:
br label %label_116
label_116:
%temp32 = phi i1 [ true, %label_112 ], [ false, %label_114 ]
%temp33 = call i32 @foo(i32 %temp26, i32 %temp27, i1 %temp32, i32 %temp31)
%temp34 = load i32, i32* %varx
%temp35 = add i32 0, 23
%temp36 = add i32 %temp34, %temp35
%temp37 = load i32, i32* %vary
%temp38 = add i32 0, 55
%temp39 = sub i32 %temp37, %temp38
%temp40 = trunc i32 %temp39 to i8
%temp41 = zext i8 %temp40 to i32
%temp42 = add i32 0, 87
%temp43 = load i32, i32* %varx
%temp44 = icmp sge i32 %temp42, %temp43
br i1 %temp44, label %label_138, label %label_140
%temp45 = add i32 0, 123
%temp46 = load i32, i32* %varx
%temp47 = mul i32 %temp45, %temp46
%temp48 = load i32, i32* %vary
%temp49 = add i32 0, 2
%temp50 = add i32 %temp48, %temp49
%temp51 = mul i32 %temp47, %temp50
label_138:
br label %label_142
label_140:
br label %label_142
label_142:
%temp52 = phi i1 [ true, %label_138 ], [ false, %label_140 ]
%temp53 = call i32 @foo(i32 %temp36, i32 %temp41, i1 %temp52, i32 %temp51)
br label %main.return
main.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %main.return
label_150:
%varx = alloca i32
store i32 0, i32* %varx
%vary = alloca i32
store i32 0, i32* %vary
%varz = alloca i32
store i32 0, i32* %varz
br label %label_69
}
