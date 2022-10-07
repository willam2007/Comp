unit lr1_pr;
interface
uses var_type;
procedure delete_prob(var s: string);
procedure proverka_marki(var s1: string; var err,err_all: boolean);//марка
procedure proverka_firm(var s1: string; var err,err_all: boolean); //производитель
procedure proverka_stoimosti(var s1: string; var summ: integer; var err,err_all: boolean);//проверка стоимости
procedure proverka_rashoda(var s1: string; var rashod: integer; var err,err_all: boolean);//проверка расхода на 100км
procedure proverka_nadejnosti(var s1: string; var  err,err_all: boolean; var  nad: byte);
procedure proverka_kamforta(var s1: string; var  err,err_all: boolean; var  nad: byte);
procedure sort(var aa:array_salon; v:integer);
implementation

procedure delete_prob(var s: string);
begin
  while pos('  ', s) > 0 do
    delete(s, pos('  ', s), 1);
end;

procedure proverka_marki(var s1: string; var err,err_all: boolean);//марка
var
  j: integer;
 // err:boolean;
begin
  err:=false;
  if (s='') or (s=' ') then
      begin
        err:= true;
        s1:= s1+f5;
      end
  else
  if length(s1)>20 then 
  begin
    err:=true;
    s1:= s1+f1;
  end
  else if not (s[1] in ['A'..'Z'])
  then 
    begin
      err := true;
      s1:= s1 + f2;
    end
    else 
      begin
      for j:= 2 to length(s1) do
      begin
        if  (s1[j] in sim + sim1) then 
          begin
            err := true;//проверка на запрещенные символы
          end;
      end;
      if err then s1:= s1+f3;
      end;
    err_all:=err;
    
end;
procedure proverka_firm(var s1: string; var err,err_all: boolean); //производитель
var
  j: integer;
begin
  err:=false;
  if (s='') or (s=' ') then
      begin
        err:= true;
        s1:= s1+f5;
      end
  else
  if length(s1)>20 then 
  begin
    err:=true;
    s1:= s1+f1;
  end
  else if not (s1[1] in ['A'..'Z'])
  then 
    begin
      err := true;
      s1:= s1 + f2;
    end
    else
      for j:= 2 to length(s1) do
      begin
        if  (s1[j] in sim + sim1) then 
          begin
            err := true;//проверка на запрещенные символы
          end;
      end;
      if err then s1:= s1+f3;
      
    err_all:=err;
      

end;

procedure proverka_stoimosti(var s1: string; var summ: integer; var err,err_all: boolean);//проверка стоимости
var
  i:integer;
begin
  err:=false;
  val(s1,summ,i);
  if i<>0 then 
    begin
      err:= true;
      s1:= s1 + f6;
    end
    else
      if (summ > 100000) or (summ < 1) then 
      begin
        err:= true;
        s1:= s1+f4;
      end;  
 err_all:=err;
end;

procedure proverka_rashoda(var s1: string; var rashod: integer; var err,err_all: boolean);//проверка расхода на 100км
var
  
   i: integer;
begin
  err:=false;
  val(s1, rashod, i);
  if i<>0 then 
    begin
      err:= true;
      s1:= s1 + f6;
    end
    else
      if (rashod < 1) or (rashod > 100) then
       begin
        err:= true;
        s1:= s1+f4;
      end;  
 err_all:=err;
end;

procedure proverka_nadejnosti(var s1: string; var  err,err_all: boolean; var  nad: byte);
var
   i: integer;
begin
  err:=false;
  val(s1, nad, i);
  if i<>0 then 
    begin
      err:= true;
      s1:= s1 + f6;
    end
    else
      if (nad < 1) or (nad > 10) then
        begin
          err:= true;
          s1:= s1+f4;
        end;
err_all:=err;
end;

procedure proverka_kamforta(var s1: string; var  err,err_all: boolean; var  nad: byte);
var
   i: integer;
begin
  err:=false;
  val(s1, nad, i);
  if i<>0 then 
    begin
      err:= true;
      s1:= s1 + f6;
    end
    else
      if (nad < 1)  or (nad > 3) then
        begin
          err:= true;
          s1:= s1+f4;
        end;
err_all:=err;        
end;

procedure viborka(var v:integer);
var 
ku:string;
normavto,i:integer;
begin
writeln('Введите название производителя');
readln(ku);
for i:= 1 to v do 
  begin
    if aa[i].marka = ku then
    begin
      writeln(aa[i].firma,' ', aa[i].summa,' ',aa[i].rashod,' ',aa[i].nad,' ',aa[i].komfort);
      normavto:=normavto + 1;  
    end;
    
  end;
    writeln('Количество автомобилей удовлетворяющих требованиям: ',normavto);
end;

procedure sort(var aa:array_salon; v:integer);
var 
  ab:salon;
  i,j:integer;
  begin
      for i:=1 to v-1 do
        for j:=i+1 to v do
          if aa[i].summa > aa[j].summa then
          begin
            ab:= aa[i];
            aa[i]:= aa[j];
            aa[j]:=ab;
          end;
          end;
          
procedure print( var aa:array_salon;v:integer);
var j:integer;
begin
  
 if v <> 0 then for j := 1 to v do 
 begin
    write( aa[j].marka + ' ');
    write( aa[j].firma + ' ');
    write( aa[j].summa + ' ');
    write( aa[j].rashod + ' ');
    write( aa[j].nad + ' ');
    write( aa[j].komfort + ' ');
    writeln( '');
  end
  else
    writeln('строк 0');
  end;
  
begin
  
end.