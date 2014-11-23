//
//  InheritablePartialNode.swift
//  GRMustache
//
//  Created by Gwendal Roué on 26/10/2014.
//  Copyright (c) 2014 Gwendal Roué. All rights reserved.
//

class InheritablePartialNode: TemplateASTNode {
    let partialNode: PartialNode
    let templateAST: TemplateAST

    init(partialNode: PartialNode, templateAST: TemplateAST) {
        self.partialNode = partialNode
        self.templateAST = templateAST
    }
    
    func acceptTemplateASTVisitor(visitor: TemplateASTVisitor) -> TemplateASTVisitResult {
        return visitor.visit(self)
    }
    
    func resolveTemplateASTNode(var node: TemplateASTNode) -> TemplateASTNode {
        for innerNode in templateAST.nodes {
            node = innerNode.resolveTemplateASTNode(node)
        }
        return node
    }
}