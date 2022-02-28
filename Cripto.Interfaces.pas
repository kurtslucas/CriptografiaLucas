unit Cripto.Interfaces;

interface

type
  ICriptografia = interface
    ['{CE27FF94-95CD-4994-A286-DA1A572D8673}']
    function Criptografar(const pTexto: String; const pChave: String = ''): String;
    function Decriptografar(const pTexto: String; const pChave: String = ''): String;
  end;

implementation

end.
