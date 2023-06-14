import { createPassword } from './utils/createPassword.js';
import chalk from 'chalk';
import { program } from 'commander';
import clipboardy from 'clipboardy';
const log = console.log;
program.version('1.0.0').description('Simple program that save passwords');

program
    .option('-l, --length <number>', 'length of password', '8')
    .option('-s, --save ', 'save password in supabase')
    .option('-nn, --no-numbers ', 'remove numbers')
    .option('-ns, --no-symbols ', 'remove symbols')
    .parse();
const { length, save, numbers, symbols } = program.opts();

const GeneratePassword = createPassword(length, numbers, symbols);
clipboardy.writeSync(GeneratePassword);
log(chalk.blue('Generated Password : ') + chalk.bold(GeneratePassword));
log(chalk.yellow('Password copied to clipboard'));
