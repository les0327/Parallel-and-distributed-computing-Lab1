
with Ada.Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;
use  Ada.Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;
with Data;

procedure Main is

   CPU1 : CPU_Range := 0;
   CPU2 : CPU_Range := 1;
   CPU3 : CPU_Range := 2;
   N    : Integer   := 1000;


   package new_data is new data(Size => N);
   use new_data;

   --Specification of Task 1 for F1
   task Task1 is
      pragma Task_Name("Task 1");
      pragma Priority(1);
      pragma CPU(CPU1);
      pragma Storage_Size(1000000000);
   end Task1;

   --Specification of Task 2 for F2
   task Task2 is
      pragma Task_Name("Task 2");
      pragma Priority(5);
      pragma CPU(CPU2);
      pragma Storage_Size(1000000000);
   end Task2;

   --Specification of Task 3 for F3
   task Task3 is
      pragma Task_Name("Task 3");
      pragma Priority(10);
      pragma CPU(CPU1);
      pragma Storage_Size(100000000);
   end Task3;

   task body Task1 is
      A, B, C, D : Vector;
      MA, MD     : Matrix;
      e          : Integer;
   begin
      Put_Line("Task 1 start");

      Fill_Vector_With_Num(A, 1);
      Fill_Vector_With_Num(B, 1);
      Fill_Vector_With_Num(C, 1);
      Fill_Vector_With_Num(D, 1);
      Fill_Matrix_With_Num(MA, 1);
      Fill_Matrix_With_Num(MD, 1);

      delay 0.2;
      e := F1(A, B, C, D, MA, MD);
      delay 0.15;

      if N <= 7 then
         Put_Line("e = " & Integer'Image(e));
      end if;
      Put_Line("Task 1 finish");
   end Task1;

task body Task2 is
      MF, MG, MH, ML : Matrix;
   begin
      Put_Line("Task 2 start");

      Fill_Matrix_With_Num(MF, 1);
      Fill_Matrix_With_Num(MG, 1);
      Fill_Matrix_With_Num(MH, 1);

      delay 0.2;
      ML := F2(MF, MG, MH);
      delay 0.2;

      if N <= 7 then
         Put_Line("ML =");
         Matrix_Output(ML);
      end if;

      Put_Line("Task 2 finish");
   end Task2;

task body Task3 is
      T, O   : Vector;
      MP, MR : Matrix;
   begin
      Put_Line("Task 3 start");

      Fill_Vector_With_Num(T, 1);
      Fill_Matrix_With_Num(MP, 1);
      Fill_Matrix_With_Num(MR, 1);

      delay 0.2;
      O := F3(MP, MR, T);
      delay 0.2;

      if N <= 7 then
         Put("O = ");
         Vector_Output(O);
      end if;

      Put_Line("Task 3 finish");
   end Task3;

begin
   Put_Line("Main task start");


   Put_Line("Main task finish");
end Main;
