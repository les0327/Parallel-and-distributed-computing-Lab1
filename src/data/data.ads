generic
   Size : Positive;
package Data is
   
   --Type declaration
   type Vector is private;
   type Matrix is private;
   
   
   --Procedure declaration
   procedure Vector_Input (v : out Vector);
   procedure Vector_Output(v : in  Vector);
   procedure Matrix_Input (m : out Matrix);
   procedure Matrix_Output(m : in  Matrix);
   procedure Fill_Vector_With_Num(v : in out Vector; num : in Integer);  
   procedure Fill_Matrix_With_Num(m : in out Matrix; num : in Integer);   
   
   --Function declaration
   function F1(A, B, C, D : in Vector; MA, MD : in Matrix) return Integer;
   function F2(MF, MG, MH : in Matrix) return Matrix;
   function F3(MP, MR : in Matrix; T : in Vector) return Vector;
   
   
   --Type determination
   private
   type Vector is array(1..Size) of Integer;
   type Matrix is array(1..Size, 1..Size) of Integer;
   
end Data;
