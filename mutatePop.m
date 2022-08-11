%变异操作(mu为变异概率)
function p = mutatePop(x, mu)

    %单点变异
    if rand <= mu
        n = numel(x);
        %随机生成变异点
        s = randi([1, n]);
        if x(s) == 0
            x(s) = 1;
        elseif x(s) == 1
            x(s) = 0;
        end
    end
    p = x;
            
end
