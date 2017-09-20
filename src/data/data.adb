with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

package body Data is

   procedure Vector_Input (v : out Vector) is
   begin
      for i in 1..Size loop
         Get(v(i));
      end loop;
   end Vector_Input;

   procedure Vector_Output(v : in  Vector) is
   begin
      Put("(");
      for i in 1..Size loop
         Put(v(i));
         Put(" ");
      end loop;
      Put(")");
      New_Line;
   end Vector_Output;

   procedure Matrix_Input (m : out Matrix) is
   begin
      for i in 1..Size loop
         for j in 1..Size loop
            Get(m(i, j));
         end loop;
      end loop;
   end Matrix_Input;

   procedure Matrix_Output(m : in  Matrix) is
   begin
      for i in 1..Size loop
         for j in 1..Size loop
            Put(m(i, j));
            Put(" ");
         end loop;
         New_Line;
      end loop;
      New_Line;
   end Matrix_Output;
   
   procedure Fill_Vector_With_Num(v : in out Vector; num : in Integer) is
   begin
      for i in 1..Size loop
         v(i) := num;
      end loop;
   end Fill_Vector_With_Num;
   
   procedure Fill_Matrix_With_Num(m : in out Matrix; num : in Integer) is
   begin
      for i in 1..Size loop
         for j in 1..Size loop
            m(i, j) := num;
         end loop;
      end loop;
   end Fill_Matrix_With_Num;
   
   --Addition of matrices
   function Matrix_Addition (A, B : in Matrix) return Matrix is
      C : Matrix;
   begin
      for i in 1..Size loop
         for j in 1..Size loop
            C(i, j) := A(i, j) + B(i, j);
         end loop;
      end loop;
      return C;
   end Matrix_Addition;

   --Multiplication of vector and matrix
   function Vector_Matrix_Multiplication(A : in Vector; B: in Matrix) return Vector is
      C: Vector;
      buf: Integer;
   begin
      for i in 1..Size loop
         buf := 0;
         for j in 1..Size loop
            buf := buf + A(j) * B(j, i);
         end loop;
         C(i) := buf;
      end loop;
      return C;
   end Vector_Matrix_Multiplication;

   -- Multiplication of matrices
   function Matrix_Multiplication(A, B: in Matrix) return Matrix is
      C: Matrix;
      buf: Integer;
   begin
      for i in 1..Size loop
         for j in 1..Size loop
            buf := 0;
            for k in 1..Size loop
               buf := buf + A(i, k)*B(k, j);
            end loop;
            C(i, j) := Buf;
         end loop;
      end loop;
      return C;
   end Matrix_Multiplication;

   --Calculation scalar product
   function Scalar (A, B : in Vector) return Integer is
      result : Integer := 0;
   begin
      for i in 1..Size loop
         result := result + A(i) * B(i);
      end loop;
      return result;
   end Scalar;

   --Sorting matrix lines in decreasing order
   function Matrix_Sort(M : in out Matrix) return Matrix is
      index, max : Integer;
   begin
      for line in 1..Size loop
         for i in 1..Size loop
            index := i;
            max   := M(line, i);
            for j in (i+1)..Size loop
               if M(line, j) > max then
                  begin
                     index := j;
                     max   := M(line, j);
                  end;
               end if;
            end loop;
            M(line, index) := M(line, i);
            M(line, i) := max;
         end loop;
      end loop;
      return M;
   end Matrix_Sort;

   --Return max element in matrix
   function Matrix_Max (M : in Matrix) return Integer is
      max : Integer := 0;
   begin
      for i in 1..Size loop
         for j in 1..Size loop
            if M(i, j) > max then
               max := M(i, j);
            end if;
         end loop;
      end loop;
      return max;
   end Matrix_Max;

   function Number_Vector_Multiplication (Num : in integer; V : Vector) return Vector is
      result_vector : Vector;
   begin
      result_vector := V;
      for i in 1..Size loop
         result_vector(i) := result_vector(i) * num;
      end loop;
      return result_vector;
   end ;

   function F1(A, B, C, D : in Vector; MA, MD : in Matrix) return Integer is
   begin
      return Scalar(A, B) + Scalar(C, Vector_Matrix_Multiplication(D, Matrix_Multiplication(MA, MD)));
   end F1;

   function F2(MF, MG, MH : in Matrix) return Matrix is
      MBuf : Matrix;
   begin
      MBuf := Matrix_Addition(MF, Matrix_Multiplication(MG, MH));
      return Matrix_Sort(MBuf);
   end F2;

   function F3(MP, MR : in Matrix; T : in Vector) return Vector is
   begin
      return Number_Vector_Multiplication(Matrix_Max(Matrix_Multiplication(Mp, MR)), T);
   end F3;

end Data;
