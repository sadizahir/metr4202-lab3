function word(string)
global BOARD_WIDTH
global BOARD_HEIGHT

prompt = 'top left corner [x,y]: ';
xy = input(prompt);
x = xy(1);
y = xy(2);
prompt = 'letter height: ';
height = input(prompt);
% x = x + 19; %%board width is 20
% y = y - 14; %%board lenght is 15

width = height*4/5;
x_c = x;
y_c = y;
line = 0;
line_h = height;
l = length(string)
clf('reset')
hold on
axis square
if (l*width > BOARD_WIDTH*2)
    for i = 1:l
       if(strcmp(string(i), '\'))
           line = 0;
           line_h = line_h + height;
       else
           line = line + width;
       end
    end
    if (line > BOARD_WIDTH*2 || line_h > BOARD_HEIGHT*2)
    display('This message wont fit on page please add a \n')
    return
    end
end
for i = 1:l
   if(strcmp(string(i),'\'))
       display('newline')
       x_c = x - height - 0.5;
       y_c = y;
   else
       fprintf('calling alphabet soup for %c\n', string(i))
       y_c = y_c + alphabet_soup(string(i), x_c,y_c,height) + 0.2
   end
end
