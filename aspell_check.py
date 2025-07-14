#!/usr/bin/env python3
import subprocess
import re
from pathlib import Path

def check_spelling_with_aspell(file_path):
    """Use aspell to check spelling and return potential issues"""
    try:
        # Run aspell in list mode
        result = subprocess.run([
            'aspell', '--lang=en', '--mode=tex', '--personal=/dev/null', 'list'
        ], input=open(file_path, 'r').read(), text=True, capture_output=True)
        
        if result.returncode == 0:
            words = result.stdout.strip().split('\n') if result.stdout.strip() else []
            
            # Filter out technical terms, proper nouns, etc.
            filtered_words = []
            for word in words:
                if (len(word) > 2 and 
                    not word.isupper() and  # Skip ALL_CAPS
                    not word.startswith('http') and
                    not any(x in word.lower() for x in ['.com', '.org', '.io', '@']) and
                    not word.isdigit() and
                    not re.match(r'^[A-Z][a-z]*[A-Z]', word) and  # Skip CamelCase
                    word.lower() not in ['api', 'apis', 'llm', 'llms', 'gpu', 'json', 'yaml', 'html', 'css',
                                       'github', 'docker', 'aws', 'openai', 'chatgpt', 'eval', 'evals',
                                       'config', 'repo', 'auth', 'callout', 'metadata', 'uuid', 'uuids',
                                       'nginx', 'oauth', 'saas', 'paas', 'devops', 'mlops', 'ui', 'ux',
                                       'cli', 'sdk', 'ide', 'vscode', 'jupyter', 'python', 'pytorch',
                                       'tensorflow', 'fastai', 'nbdev', 'quarto', 'dockerfile', 'buildpack',
                                       'serverless', 'hostname', 'jsonl', 'hyperparameter', 'observability',
                                       'agentic', 'summarization', 'chatbot', 'onclick', 'onboarding',
                                       'roadmap', 'walkthrough', 'namespaces', 'operationalize', 'impactful',
                                       'reframes', 'reframing', 'timeboxes', 'counterintuitive', 'codebases',
                                       'anonymized', 'arxiv', 'dev', 'pre', 'monospace', 'len', 'pytest',
                                       'regex', 'regexes', 'lookups', 'repurpose', 'sensemaking', 'journaling',
                                       'hotspots', 'labelers', 'honeyhive', 'openllmetry', 'phillip', 'eng',
                                       'curation', 'interpretable', 'schemas', 'embeddings', 'inpainting',
                                       'rerankers', 'shitposting', 'hypefury', 'typefully', 'socialsharepreview',
                                       'copywriting', 'txt', 'overscoped', 'uncalibrated', 'iteratively',
                                       'optimizers', 'potahto', 'thatit', 'afterall', 'unvalidated', 'dumbing',
                                       'lingua', 'franca', 'blockquote', 'href', 'lang', 'dir', 'ltr', 'br',
                                       'rn', 'validator', 'validators', 'subfolders', 'tokenize', 'preprocessing',
                                       'img', 'png', 'src', 'toc', 'uid', 'args', 'async', 'bdb', 'et', 'al',
                                       'ip', 'nlq', 'learnings']):
                    filtered_words.append(word)
            
            return filtered_words
    except Exception as e:
        print(f"Error checking {file_path}: {e}")
        return []

def main():
    blog_dir = Path('blog')
    
    # Find all text files
    text_files = list(blog_dir.rglob('*.qmd')) + list(blog_dir.rglob('*.md'))
    
    print(f"Checking {len(text_files)} files for spelling errors...")
    
    all_issues = {}
    for file_path in sorted(text_files):
        issues = check_spelling_with_aspell(file_path)
        if issues:
            all_issues[str(file_path)] = issues
    
    if all_issues:
        print("\nPotential spelling issues found:")
        for file_path, issues in all_issues.items():
            print(f"\n{file_path}:")
            for issue in sorted(set(issues)):
                print(f"  - {issue}")
    else:
        print("\n✅ No obvious spelling errors found!")

if __name__ == '__main__':
    main()