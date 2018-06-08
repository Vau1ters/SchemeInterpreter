package src;
import haxe.io.*;
import src.lexer.Lexer;
import src.parser.Parser;
import src.eval.Eval;
import src.env.Env;
using src.show.Show;

class Main{
    public static function main(){
        var args = Sys.args();
        var input : Input = Sys.stdin();
        var parser : Parser;
        var lexer : Lexer;
        var eval = new Eval();
        var env = eval.primitiveBindings();
        while(true){
            // get standard input
            var line = input.readLine();
            lexer = new Lexer(line);
            if(line == "quit")break;
            parser = new Parser();
            var parsed = parser.parse(lexer);
            //trace(parsed);
            switch(parsed){
                case Right(exps) :
                    var result = eval.eval(env, exps[0]).toString();
                    // env.showEnv(false);
                    trace(result);
                case Left(_):
                    trace("parse error");
            }
        }
    }
}
