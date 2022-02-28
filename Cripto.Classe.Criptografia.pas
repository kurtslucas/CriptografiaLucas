unit Cripto.Classe.Criptografia;

interface

uses
  Cripto.Interfaces, StrUtils, SysUtils;

type
  TCriptografia = class(TInterfacedObject, ICriptografia)
  private
    // Atributo interno que indicará qual a chave criptográfica a usar na
    // criptografia, caso não informe nenhuma chave, usa-se a chave padrão da
    // classe <cChavePrivada>.
    FChave: String;

    const
      // Chaves básicas. Os caracteres devem se manter, mas a ordem dos mesmos
      // pode ser alterada para cada projeto para aumentar a segurança da criptografia.
      cLetras = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      cAcentuacoes = 'áéíóúàèìòùãõâêîôûäëïöüıÿçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜİŸÇ';
      cNumeros = '0123456789';
      cSimbolos = ' ''"!@#$%¨&*()_-+=¹²³£¢§\|,.;/~´][<>:?^`}{°ºª¬';
      cChaveCripto = cLetras + cAcentuacoes + cNumeros + cSimbolos;

      // O mesmo ocorre com as chaves numéricas, os números podem ser alterados
      // para qualquer outro valor inteiro para aumentar a segurança da criptografia.
      cChaveNum0 = 19;
      cChaveNum1 = 21;
      cChaveNum2 = 33;
      cChaveNum3 = 45;
      cChaveNum4 = 56;
      cChaveNum5 = 68;
      cChaveNum6 = 77;
      cChaveNum7 = 84;
      cChaveNum8 = 92;
      cChaveNum9 = 02;

      // A chave privada é a frase usada para base criptográfica, também pode ser modificada.
      cChavePrivada = 'BaseadoNumEpisodioDoScicast';

    function GetChaveNum(const pPosition: Integer): Integer;
    function GetChaveIdx(const pPosition: Integer): Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ICriptografia;
    function Criptografar(const pTexto: String;
      const pChave: String = ''): String;
    function Decriptografar(const pTexto: String;
      const pChave: String = ''): String;
  end;

implementation

{ TCriptografia }

constructor TCriptografia.Create;
begin

end;

function TCriptografia.Criptografar(const pTexto: String;
  const pChave: String = ''): String;
var
  pL, pLC, pCh, I, vRet, vPos, vChaveNum, vChaveTxt: Integer;
  vTexto: String;
begin
  // Recebe um texto e/ou uma chave e retorna o texto criptografado.
  Result := '';

  // Caso a chave seja vazia, usa-se a chava privada da classe.
  FChave := IfThen(pChave.Trim.IsEmpty, cChavePrivada, pChave.Trim);

  vTexto := ReverseString(pTexto);
  pL := Length(vTexto);
  pLC := Length(cChaveCripto);
  pCh := Length(FChave);

  for I := 1 to pL do
  begin
    vPos := Pos(vTexto[I], cChaveCripto);
    vChaveNum := GetChaveNum(I);
    vChaveTxt := GetChaveIdx(I);
    vRet := vPos + I + vChaveNum + vChaveTxt + pL + pCh;
    while (vRet > pLC) do
      vRet := vRet - pLC;
    Result := Result + cChaveCripto[vRet];
  end;
end;

function TCriptografia.Decriptografar(const pTexto: String;
  const pChave: String = ''): String;
var
  pL, pLC, pCh, I, vPos, vRet, vChaveNum, vChaveTxt: Integer;
  vTexto, vEnter: string;
begin
  // Recebe um pTexto e/ou uma chave e retorna o texto decriptografado.
  Result := '';

  // Caso a chave seja vazia, usa-se a chava privada da classe.
  FChave := IfThen(pChave.Trim.IsEmpty, cChavePrivada, pChave.Trim);

  vTexto := pTexto;
  pL := Length(vTexto);
  pLC := Length(cChaveCripto);
  pCh := Length(FChave);

  for I := 1 to pL do
  begin
    vPos := Pos(vTexto[I], cChaveCripto);
    vChaveNum := GetChaveNum(I);
    vChaveTxt := GetChaveIdx(I);
    vRet := vPos - I - vChaveNum - vChaveTxt - pL - pCh;
    while (vRet < 1) do
      vRet := vRet + pLC;
    Result := Result + cChaveCripto[vRet];
  end;

  vEnter := RightStr(cChaveCripto, 1) + RightStr(cChaveCripto, 1);
  Result := ReverseString(Result).Replace(vEnter, #13#10);
end;

destructor TCriptografia.Destroy;
begin

  inherited;
end;

function TCriptografia.GetChaveIdx(const pPosition: Integer): Integer;
var
  pCh, vIdx: Integer;
begin
  // Retorna o indice a retonrar dentro da string FChave, com base no resto da
  // divisão da posição pelo tamanho da string FChave.

  pCh := Length(FChave);
  vIdx := (pPosition mod pCh) + 1;
  Result := Pos(FChave[vIdx], cChaveCripto);
end;

function TCriptografia.GetChaveNum(const pPosition: Integer): Integer;
begin
  // Verifica qual a chave numérica a retornar com base no resto da divisão de
  // Position para quantidade de chaves numéricas disponíveis na classe.

  case pPosition mod 10 of
    0: Result := cChaveNum0;
    1: Result := cChaveNum1;
    2: Result := cChaveNum2;
    3: Result := cChaveNum3;
    4: Result := cChaveNum4;
    5: Result := cChaveNum5;
    6: Result := cChaveNum6;
    7: Result := cChaveNum7;
    8: Result := cChaveNum8;
    9: Result := cChaveNum9;
  end;
end;

class function TCriptografia.New: ICriptografia;
begin
  Result := TCriptografia.Create;
end;

end.
