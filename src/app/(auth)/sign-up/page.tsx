"use client";
import { useState } from "react";
import { set, useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import MoonLoader from "react-spinners/MoonLoader";

import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { PasswordInput } from "@/components/ui/password-input";
import Link from "next/link";
import { buttonVariants } from "@/components/ui/button";
import { authClient } from "@/lib/auth-client"; //import the auth client
import { useToast } from "@/hooks/use-toast";

const formSchema = z.object({
  username: z.string(),
  email: z.string(),
  password: z.string(),
  confirm_password: z.string(),
});

export default function SignUp() {
  const [loading, setLoading] = useState(false);
  const { toast } = useToast();

  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      username: "",
      email: "",
      password: "",
      confirm_password: "",
    },
  });

  async function onSubmit(values: z.infer<typeof formSchema>) {
    try {
      console.log(values);

      const { data, error } = await authClient.signUp.email(
        {
          email: values.email,
          password: values.password,
          name: values.username,
        },
        {
          onRequest: (ctx) => {
            //show loading
            setLoading(true);
          },
          onSuccess: (ctx) => {
            //redirect to the dashboard
            setLoading(false);
            toast({
              title: "Success",
              description: "Account created successfully",
            });
          },
          onError: (ctx) => {
            alert(ctx.error.message);
          },
        }
      );
    } catch (error) {
      console.error("Form submission error", error);
    }
  }

  return (
    <div className="main h-screen w-full flex items-center justify-center">
      <div className="container">
        <div className="heading-text justify-center text-center">
          <h1 className="text-4xl font-bold">Sign Up</h1>
          <p className="text-lg text-gray-500">
            Create an account to get started.
          </p>
        </div>
        <Form {...form}>
          <form
            onSubmit={form.handleSubmit(onSubmit)}
            className="space-y-8 max-w-6xl mx-auto p-10 w-4/12"
          >
            <FormField
              control={form.control}
              name="username"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Username</FormLabel>
                  <FormControl>
                    <Input placeholder="johndoe" type="text" {...field} />
                  </FormControl>

                  <FormMessage />
                </FormItem>
              )}
            />

            <FormField
              control={form.control}
              name="email"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Email</FormLabel>
                  <FormControl>
                    <Input
                      placeholder="johndeo@email.com"
                      type="email"
                      {...field}
                    />
                  </FormControl>
                  <FormDescription>
                    Use correct email for verification.
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            <FormField
              control={form.control}
              name="password"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Password</FormLabel>
                  <FormControl>
                    <PasswordInput placeholder="*********" {...field} />
                  </FormControl>
                  <FormDescription>Enter your password.</FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            <FormField
              control={form.control}
              name="confirm_password"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Confirm Password</FormLabel>
                  <FormControl>
                    <PasswordInput placeholder="Placeholder" {...field} />
                  </FormControl>
                  <FormDescription>Confirm your password.</FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            <Button className="w-full" variant="main" type="submit">
              {loading ? (
                <MoonLoader color="#000000" size={20} />
              ) : (
                "Create Account"
              )}
            </Button>
          </form>
        </Form>

        <div className="footer">
          <p className="text-center text-gray-400">
            Already have an account?{" "}
            <Link
              href="/sign-in"
              className={buttonVariants({ variant: "link" })}
            >
              Sign In
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
}
