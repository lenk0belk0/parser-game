-- $Name:Игра в комнату$
-- $Version: 0.01$
-- $Author: EAnisimova$

require "dbg"
require "fmt"
require "parser/mp-ru"

fmt.para = true;


obj {
	-"телефон|сотовый";
    nam = "phone";
    disp = "сотовый";
    description = [[ Сотовый телефон. Он выключен. ]];
    before_SwitchOn = [[ Не включается. ]];
}

obj {
	-"ручка";
    nam = "pen";
    disp = "ручка";
    description = [[ Обычная шариковая ручка с черными чернилами. Нужна чтобы закончить игру.]];
    after_Take = function(s)
        move(me(), 'final')
    end;
}

window = Class {
	-"окно";
	disp = "окно";
	description = [[ Ничего особенного. ]];
	before_Enter = [[ Лучше этого не делать. ]];

} : attr 'static, enterable'

flor = Class {
	-"пол";
	disp = "пол";
} : attr 'scenery, supporter'

room {
	-"комната";
	nam = "main";
	title = 'Комната';
	disp = 'комната';
	dsc = "Это небольшая комната";
	obj = {
		flor {
			nam = 'main_flor';
			obj = {
				'pen'
			};
		}
	};
	after_Drop = function(s, w) 
		move(w, 'main_flor')
		return false;
	end;
} : with {
	window {}
}

room {
	nam = "final";
	title = "Конец!";
	dsc = 'Вот и всё.';
	-- noparser = true;
}


function init()
	-- Here will bi initialization
	take('phone')
	pl.word = -"ты/жр,2л"
	pl.capacity = 1
end;
