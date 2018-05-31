% �����O���t�C�L���O���t�̐݌v
% function [L, D, A] = graph(edge,class)
% ����:
%   node:���_�W���C���_�̐�
%   edge:�ӏW���C��ʓI�ȕ\�L�ʂ�(i,j)�Ƃ��s��ɂ܂Ƃ߂�
%   epsilon:�y�����s��ɕϊ����邽�߂̐���
% �Ԃ�l:
%   L:�O���t���v���V�A��(P:�y�����s��C���U���Ԃ̏ꍇ)
%   D:�����s��
%   A:�אڍs��
function [L, D, A] = graph(node,edge,varargin,epsilon)
n_e = size(edge,1); % size of edge
D = zeros(node);    % degree matrix
A = zeros(node);    % adjacency matrix
    if (strcmpi(varargin, 'directed'))
        for i = 1:n_e
            ele2 = edge(i,2);
            D(ele2,ele2) = D(ele2,ele2) + 1;    % sum 1 by dim
        end
        for i = 1:n_e
            ele1 = edge(i,1);
            ele2 = edge(i,2);
            A(ele2,ele1) = 1;  % assign 1
        end
        L = D - A;
    elseif (strcmpi(varargin, 'undirected'))
        ID = [];
        T_edge(:,1) = edge(:,2);
        T_edge(:,2) = edge(:,1);
        for i = 1:n_e
            for j = 1:n_e
                if j >= i
                    id = find(edge(i,:) == T_edge(j,:));
                end
                if ~(isempty(id))&(id == [1, 2])
                    ID = [ID; i, j];
                end
            end
        end
        edge(ID(:,1),:) = [];
        n_e = size(edge,1); % size of edge
        for i = 1:n_e
            ele1 = edge(i,1);
            ele2 = edge(i,2);
            D(ele2,ele2) = D(ele2,ele2) + 1;    % sum 1 by dim
            D(ele1,ele1) = D(ele1,ele1) + 1;    % case of undirected graph
        end
        for i = 1:n_e
            ele1 = edge(i,1);
            ele2 = edge(i,2);
            A(ele1,ele2) = 1;  % assign 1
            A(ele2,ele1) = 1;  % because of undirected graph
        end
        L = D - A;
    end
    if nargin == 4
        L = eye(node) - epsilon*L;
    end
end