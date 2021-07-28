/* TypeScript file generated from TaskResult.resi by genType. */
/* eslint-disable import/first */


// @ts-ignore: Implicit any on import
import * as Curry__Es6Import from '@rescript/std/lib/es6/curry.js';
const Curry: any = Curry__Es6Import;

// @ts-ignore: Implicit any on import
import * as TaskResultBS__Es6Import from './TaskResult.bs';
const TaskResultBS: any = TaskResultBS__Es6Import;

// tslint:disable-next-line:max-classes-per-file 
// tslint:disable-next-line:class-name
export abstract class t<a,e> { protected opaque!: a | e }; /* simulate opaque types */
export type taskResult<a,e> = t<a,e>;

// tslint:disable-next-line:interface-over-type-literal
export type computation<a,e> = (_1:((_1:
    { tag: "Ok"; value: a }
  | { tag: "Error"; value: e }) => void)) => void;

// tslint:disable-next-line:interface-over-type-literal
export type cancelFunction = () => void;

// tslint:disable-next-line:interface-over-type-literal
export type todoType = { readonly name: string; readonly status: boolean };

export const make: <a,e>(_1:computation<a,e>) => t<a,e> = function <a,e>(Arg1: any) {
  const result = TaskResultBS.make(function (Arg11: any) {
      const result1 = Arg1(function (Arg12: any) {
          const result2 = Arg11(Arg12.tag==="Ok"
            ? {TAG: 0, _0:Arg12.value} as any
            : {TAG: 1, _0:Arg12.value} as any);
          return result2
        });
      return result1
    });
  return result
};

export const pure: <a,e>(_1:
    { tag: "Ok"; value: a }
  | { tag: "Error"; value: e }) => t<a,e> = function <a,e>(Arg1: any) {
  const result = TaskResultBS.pure(Arg1.tag==="Ok"
    ? {TAG: 0, _0:Arg1.value} as any
    : {TAG: 1, _0:Arg1.value} as any);
  return result
};

export const fork: <a,e>(_1:t<a,e>, _2:((_1:
    { tag: "Ok"; value: a }
  | { tag: "Error"; value: e }) => void)) => cancelFunction = function <a,e>(Arg1: any, Arg2: any) {
  const result = Curry._2(TaskResultBS.fork, Arg1, function (Arg11: any) {
      const result1 = Arg2(Arg11.TAG===0
        ? {tag:"Ok", value:Arg11._0}
        : {tag:"Error", value:Arg11._0});
      return result1
    });
  return result
};

export const forkSwitch: <a,e>(_1:t<a,e>, _2:{ readonly onOk: ((_1:a) => void); readonly onErr: ((_1:e) => void) }) => cancelFunction = function <a,e>(Arg1: any, Arg2: any) {
  const result = Curry._3(TaskResultBS.forkSwitch, Arg1, Arg2.onOk, Arg2.onErr);
  return result
};
