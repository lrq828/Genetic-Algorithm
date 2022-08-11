clc;clear

nVar = 100;
nPop = 30;


%����������
maxIt = 2000;
%�Ӵ���ģ����
nPc = 0.8;
%�Ӵ���ģ��С
nC = round(nPop * nPc / 2) * 2;  %roundȡ���󣬳�2��2����ż��������;
%�������
nMu = 0.01;

template.x = [];
template.y = [];

Parent = repmat(template, nPop, 1);

for i = 1 : nPop
    
    Parent(i).x = randi([0,1], 1, nVar);
    Parent(i).y = fun(Parent(i).x);

end

for It = 1 : maxIt
    
    Offspring = repmat(template, nC/2, 2);
    
    for j = 1 : nC / 2
        
        %�Ը�������ѡ��
        p1 = selectPop(Parent);
        p2 = selectPop(Parent);
        %���н���
        [Offspring(j, 1).x, Offspring(j, 2).x] = crossPop(p1.x, p2.x);
        
    end
    
    Offspring = Offspring(:);
    
    for k = 1 : nC
        
        Offspring(k).x = mutatePop(Offspring(k).x, nMu);
        Offspring(k).y = fun(Offspring(k).x);
        
    end
    
    newPop = [Parent;Offspring];
    [~, so] = sort([newPop.y],'ascend');
    newPop = newPop(so);
    Parent = newPop(1: nPop);

    disp(['����������', num2str(It), '����СֵΪ', num2str(Parent(1).y)])
    
end
