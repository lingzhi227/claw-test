#!/usr/bin/env node
/**
 * Master Test Runner for Git Skills
 * Runs all Git skill tests and reports results
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const SKILLS_DIR = path.join(__dirname, '../skills');
const TEST_DIR = path.join(__dirname, '../test-workspace');

// Colors for output
const colors = {
  reset: '\x1b[0m',
  green: '\x1b[32m',
  red: '\x1b[31m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  cyan: '\x1b[36m'
};

function log(message, color = 'reset') {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

function setupTestWorkspace() {
  log('\n📦 Setting up test workspace...', 'cyan');

  // Clean up existing test workspace
  if (fs.existsSync(TEST_DIR)) {
    execSync(`rm -rf ${TEST_DIR}`);
  }

  // Create fresh test workspace
  fs.mkdirSync(TEST_DIR, { recursive: true });
  log('✓ Test workspace created', 'green');
}

function cleanupTestWorkspace() {
  log('\n🧹 Cleaning up test workspace...', 'cyan');
  if (fs.existsSync(TEST_DIR)) {
    execSync(`rm -rf ${TEST_DIR}`);
  }
  log('✓ Test workspace cleaned', 'green');
}

function getSkillScripts() {
  const files = fs.readdirSync(SKILLS_DIR);
  return files
    .filter(file => file.endsWith('.sh'))
    .sort()
    .map(file => path.join(SKILLS_DIR, file));
}

function runSkill(skillPath) {
  const skillName = path.basename(skillPath, '.sh');
  log(`\n${'='.repeat(60)}`, 'blue');
  log(`Testing: ${skillName}`, 'cyan');
  log('='.repeat(60), 'blue');

  try {
    // Make script executable
    execSync(`chmod +x ${skillPath}`);

    // Run the skill in test workspace
    const output = execSync(`cd ${TEST_DIR} && bash ${skillPath}`, {
      encoding: 'utf8',
      stdio: 'pipe'
    });

    console.log(output);
    log(`✅ ${skillName} PASSED`, 'green');
    return { skill: skillName, status: 'PASSED', error: null };
  } catch (error) {
    log(`❌ ${skillName} FAILED`, 'red');
    console.error(error.stdout || error.message);
    return { skill: skillName, status: 'FAILED', error: error.message };
  }
}

function printSummary(results) {
  const passed = results.filter(r => r.status === 'PASSED').length;
  const failed = results.filter(r => r.status === 'FAILED').length;
  const total = results.length;

  log('\n' + '='.repeat(60), 'blue');
  log('TEST SUMMARY', 'cyan');
  log('='.repeat(60), 'blue');

  log(`Total Skills: ${total}`, 'cyan');
  log(`Passed: ${passed}`, 'green');
  log(`Failed: ${failed}`, failed > 0 ? 'red' : 'green');

  if (failed > 0) {
    log('\nFailed Skills:', 'red');
    results
      .filter(r => r.status === 'FAILED')
      .forEach(r => log(`  • ${r.skill}`, 'red'));
  }

  log('\n' + '='.repeat(60), 'blue');

  if (failed === 0) {
    log('🎉 ALL TESTS PASSED! 🎉', 'green');
  } else {
    log('⚠️  SOME TESTS FAILED', 'red');
  }

  return failed === 0;
}

async function main() {
  log('\n🚀 Git Skills Test Suite', 'cyan');
  log('Testing all Git skills for Claude Code\n', 'cyan');

  setupTestWorkspace();

  const skillScripts = getSkillScripts();
  log(`Found ${skillScripts.length} skill scripts to test\n`, 'yellow');

  const results = [];

  for (const skillPath of skillScripts) {
    const result = runSkill(skillPath);
    results.push(result);
  }

  const allPassed = printSummary(results);

  cleanupTestWorkspace();

  process.exit(allPassed ? 0 : 1);
}

main().catch(error => {
  log(`\n❌ Test runner error: ${error.message}`, 'red');
  process.exit(1);
});
