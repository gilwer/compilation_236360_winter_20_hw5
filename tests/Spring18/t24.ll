; saves: print
; saves: printi
; saves: x
; ID.str : x
; ---end scope---
; x INT -1
; saves: f1
; saves: x
; ID.str : x
; ---end scope---
; x BYTE -1
; saves: f2
; saves: c
; ID.str : c
; ---end scope---
; c BOOL -1
; saves: f3
; saves: a
; saves: c
; saves: d
; saves: e
; saves: f
; saves: g
; saves: h
; saves: i
; ID.str : a
; ID.str : c
; ID.str : d
; ID.str : g
; ID.str : h
; ---end scope---
; a INT -1
; c INT -2
; d BYTE -3
; e BOOL -4
; f BOOL -5
; g BYTE -6
; h INT -7
; i BOOL -8
; saves: callMe
; ---end scope---
; saves: main
; ---end scope---
; print (STRING)->VOID 0
; printi (INT)->VOID 0
; f1 (INT)->INT 0
; f2 (BYTE)->BYTE 0
; f3 (BOOL)->BOOL 0
; callMe (INT,INT,BYTE,BOOL,BOOL,BYTE,INT,BOOL)->VOID 0
; main ()->VOID 0
@.str_specifier = constant [4 x i8] c"%s\0A\00"
@.int_specifier = constant [4 x i8] c"%d\0A\00"
@.zero_division = constant [23 x i8] c"Error division by zero\00"
@.temp2 = constant [3x i8] c"f1\00"
@.temp5 = constant [3x i8] c"f2\00"
@.temp8 = constant [3x i8] c"f3\00"
@.temp15 = constant [7x i8] c"called\00"
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
define i32 @f1(i32 %arg0) {
%retvar = alloca i32
store i32 0, i32* %retvar
br label %label_27
f1.return:
%temp1 = load i32, i32* %retvar 
ret i32 %temp1
label_17:
call void @print(i8* getelementptr ([3 x i8], [3 x i8]* @.temp2, i32 0, i32 0))
%temp3 = load i32, i32* %varx
store i32 %temp3, i32* %retvar
br label %f1.return
br label %f1.return
f1.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %f1.return
label_27:
%varx = alloca i32
store i32 %arg0, i32* %varx
br label %label_17
}
define i32 @f2(i32 %arg0) {
%retvar = alloca i32
store i32 0, i32* %retvar
br label %label_49
f2.return:
%temp4 = load i32, i32* %retvar 
ret i32 %temp4
label_39:
call void @print(i8* getelementptr ([3 x i8], [3 x i8]* @.temp5, i32 0, i32 0))
%temp6 = load i32, i32* %varx
store i32 %temp6, i32* %retvar
br label %f2.return
br label %f2.return
f2.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %f2.return
label_49:
%varx = alloca i32
store i32 %arg0, i32* %varx
br label %label_39
}
define i32 @f3(i1 %arg0) {
%retvar = alloca i32
store i32 0, i32* %retvar
br label %label_81
f3.return:
%temp7 = load i32, i32* %retvar 
ret i32 %temp7
label_61:
call void @print(i8* getelementptr ([3 x i8], [3 x i8]* @.temp8, i32 0, i32 0))
%temp9 = load i32, i32* %varc
%temp10 = trunc i32 %temp9 to i1
%temp11 =  icmp eq i1 true, %temp10
br i1 %temp11, label %label_67, label %label_69
label_67:
br label %label_71
label_69:
br label %label_71
label_71:
%temp12 = phi i1 [ true, %label_67 ], [ false, %label_69 ]
%temp13 = zext i1 %temp12 to i32
store i32 %temp13, i32* %retvar
br label %f3.return
br label %f3.return
f3.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %f3.return
label_81:
%varc = alloca i32
%temp14 = zext i1 %arg0 to i32
store i32 %temp14, i32* %varc
br label %label_61
}
define void @callMe(i32 %arg0, i32 %arg1, i32 %arg2, i1 %arg3, i1 %arg4, i32 %arg5, i32 %arg6, i1 %arg7) {
br label %label_108
callMe.return:
ret void
label_91:
call void @print(i8* getelementptr ([7 x i8], [7 x i8]* @.temp15, i32 0, i32 0))
%temp16 = load i32, i32* %vara
call void @printi(i32 %temp16)
%temp17 = load i32, i32* %varc
call void @printi(i32 %temp17)
%temp18 = load i32, i32* %vard
call void @printi(i32 %temp18)
%temp19 = load i32, i32* %varg
call void @printi(i32 %temp19)
%temp20 = load i32, i32* %varh
call void @printi(i32 %temp20)
br label %callMe.return
callMe.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %callMe.return
label_108:
%vara = alloca i32
store i32 %arg0, i32* %vara
%varc = alloca i32
store i32 %arg1, i32* %varc
%vard = alloca i32
store i32 %arg2, i32* %vard
%vare = alloca i32
%temp21 = zext i1 %arg3 to i32
store i32 %temp21, i32* %vare
%varf = alloca i32
%temp22 = zext i1 %arg4 to i32
store i32 %temp22, i32* %varf
%varg = alloca i32
store i32 %arg5, i32* %varg
%varh = alloca i32
store i32 %arg6, i32* %varh
%vari = alloca i32
%temp23 = zext i1 %arg7 to i32
store i32 %temp23, i32* %vari
br label %label_91
}
define void @main() {
br label %label_193
main.return:
ret void
label_134:
%temp24 = add i32 0, 2
%temp25 = call i32 @f1(i32 %temp24)
%temp26 = add i32 0, 4
%temp27 = call i32 @f2(i32 %temp26)
%temp28 = add i32 0, 5
%temp29 = call i32 @f2(i32 %temp28)
br label %label_142
label_142:
br label %label_146
label_144:
br label %label_146
label_146:
%temp30 = phi i1 [ true, %label_142 ], [ false, %label_144 ]
%temp31 = call i32 @f3(i1 %temp30)
br label %label_152
label_150:
br label %label_154
label_152:
br label %label_154
label_154:
%temp32 = phi i1 [ true, %label_150 ], [ false, %label_152 ]
%temp33 = call i32 @f3(i1 %temp32)
%temp34 = add i32 0, 3
%temp35 = call i32 @f2(i32 %temp34)
%temp36 = add i32 0, 22
%temp37 = call i32 @f1(i32 %temp36)
br label %label_164
label_162:
br label %label_166
label_164:
br label %label_166
label_166:
%temp38 = phi i1 [ true, %label_162 ], [ false, %label_164 ]
%temp39 = call i32 @f3(i1 %temp38)
label_169:
br label %label_173
label_171:
br label %label_173
label_173:
%temp40 = phi i1 [ true, %label_169 ], [ false, %label_171 ]
label_175:
br label %label_179
label_177:
br label %label_179
label_179:
%temp41 = phi i1 [ true, %label_175 ], [ false, %label_177 ]
label_181:
br label %label_185
label_183:
br label %label_185
label_185:
%temp42 = phi i1 [ true, %label_181 ], [ false, %label_183 ]
call void @callMe(i32 %temp25, i32 %temp27, i32 %temp29, i1 %temp42, i1 %temp41, i32 %temp35, i32 %temp37, i1 %temp40)
br label %main.return
main.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %main.return
label_193:
br label %label_134
}
