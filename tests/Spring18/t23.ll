; saves: print
; saves: printi
; ---end scope---
; saves: f1
; ---end scope---
; saves: f2
; saves: x
; ---end scope---
; x INT 0
; saves: x
; ---end scope---
; x INT 0
; saves: x
; ---end scope---
; x INT 0
; saves: x
; ---end scope---
; x INT 0
; saves: x
; ---end scope---
; x INT 0
; saves: x
; ---end scope---
; x INT 0
; saves: i
; ID.str : i
; ID.str : i
; ---end scope---
; ---end scope---
; ID.str : i
; ID.str : i
; ---end scope---
; ---end scope---
; ---end scope---
; i INT 0
; saves: main
; ---end scope---
; print (STRING)->VOID 0
; printi (INT)->VOID 0
; f1 ()->BOOL 0
; f2 ()->BOOL 0
; main ()->VOID 0
@.str_specifier = constant [4 x i8] c"%s\0A\00"
@.int_specifier = constant [4 x i8] c"%d\0A\00"
@.zero_division = constant [23 x i8] c"Error division by zero\00"
@.temp2 = constant [3x i8] c"f1\00"
@.temp6 = constant [3x i8] c"f2\00"
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
define i32 @f1() {
%retvar = alloca i32
store i32 0, i32* %retvar
br label %label_34
f1.return:
%temp1 = load i32, i32* %retvar 
ret i32 %temp1
label_17:
call void @print(i8* getelementptr ([3 x i8], [3 x i8]* @.temp2, i32 0, i32 0))
br label %label_20
label_20:
br label %label_24
label_22:
br label %label_24
label_24:
%temp3 = phi i1 [ true, %label_20 ], [ false, %label_22 ]
%temp4 = zext i1 %temp3 to i32
store i32 %temp4, i32* %retvar
br label %f1.return
br label %f1.return
f1.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %f1.return
label_34:
br label %label_17
}
define i32 @f2() {
%retvar = alloca i32
store i32 0, i32* %retvar
br label %label_61
f2.return:
%temp5 = load i32, i32* %retvar 
ret i32 %temp5
label_44:
call void @print(i8* getelementptr ([3 x i8], [3 x i8]* @.temp6, i32 0, i32 0))
br label %label_49
label_47:
br label %label_51
label_49:
br label %label_51
label_51:
%temp7 = phi i1 [ true, %label_47 ], [ false, %label_49 ]
%temp8 = zext i1 %temp7 to i32
store i32 %temp8, i32* %retvar
br label %f2.return
br label %f2.return
f2.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %f2.return
label_61:
br label %label_44
}
define void @main() {
br label %label_204
main.return:
ret void
label_68:
%temp9 = call i32 @f1()
br label %label_71
label_71:
%temp10 = call i32 @f2()
br label %label_76
label_74:
br label %label_80
label_76:
%varx = alloca i32
store i32 0, i32* %varx
br label %label_74
label_80:
%temp11 = call i32 @f2()
br label %label_83
label_83:
%temp12 = call i32 @f1()
br label %label_88
label_86:
br label %label_92
label_88:
%varx = alloca i32
store i32 0, i32* %varx
br label %label_86
label_92:
%temp13 = call i32 @f2()
br label %label_95
label_95:
%temp14 = call i32 @f1()
br label %label_100
label_98:
br label %label_104
label_100:
%varx = alloca i32
store i32 0, i32* %varx
br label %label_98
label_104:
%temp15 = call i32 @f1()
br label %label_107
label_107:
%temp16 = call i32 @f2()
br label %label_112
label_110:
br label %label_116
label_112:
%varx = alloca i32
store i32 0, i32* %varx
br label %label_110
label_116:
%temp17 = call i32 @f2()
br label %label_119
label_119:
%temp18 = call i32 @f1()
br label %label_124
label_122:
br label %label_128
label_124:
%varx = alloca i32
store i32 0, i32* %varx
br label %label_122
label_128:
%temp19 = call i32 @f2()
br label %label_131
label_131:
%temp20 = call i32 @f1()
br label %label_136
label_134:
br label %label_140
label_136:
%varx = alloca i32
store i32 0, i32* %varx
br label %label_134
label_140:
%temp21 = add i32 0, 0
store i32 %temp21, i32* %vari
br label %label_144
label_144:
%temp22 = call i32 @f1()
br label %label_147
label_147:
%temp23 = load i32, i32* %vari
%temp24 = add i32 0, 2
%temp25 = icmp slt i32 %temp23, %temp24
br i1 %temp25, label %label_155, label %label_169
br label %label_167
label_153:
br label %label_155
label_155:
br label %label_163
label_157:
%temp26 = load i32, i32* %vari
%temp27 = add i32 0, 2
%temp28 = add i32 %temp26, %temp27
store i32 %temp28, i32* %vari
br label %label_165
label_163:
br label %label_157
label_165:
br label %label_144
label_167:
br label %label_153
label_169:
%temp29 = add i32 0, 0
store i32 %temp29, i32* %vari
br label %label_173
label_173:
%temp30 = call i32 @f2()
br label %label_176
label_176:
%temp31 = load i32, i32* %vari
%temp32 = add i32 0, 2
%temp33 = icmp slt i32 %temp31, %temp32
br i1 %temp33, label %label_184, label %label_198
br label %label_196
label_182:
br label %label_184
label_184:
br label %label_192
label_186:
%temp34 = load i32, i32* %vari
%temp35 = add i32 0, 3
%temp36 = add i32 %temp34, %temp35
store i32 %temp36, i32* %vari
br label %label_194
label_192:
br label %label_186
label_194:
br label %label_173
label_196:
br label %label_182
label_198:
br label %main.return
main.zero_division_label:
call void @print(i8* getelementptr ([23 x i8], [23 x i8]* @.zero_division, i32 0, i32 0))
call void @exit(i32 1)
br label %main.return
label_204:
%vari = alloca i32
store i32 0, i32* %vari
br label %label_68
}
